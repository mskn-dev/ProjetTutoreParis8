<%@ Page Title="FlickrG" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="instagram.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
			body {
				font-family: Monospace;
				background-color: #f0f0f0;
				margin: 0px;
				overflow: hidden;
			}

			a { color: #f0f0f0; }
			
			h1 {
              text-align: center;
              font-family: 'Lato';
              font-size: 36px;
              padding: 20px;
              font-weight: bold;
              color: #4F4F4F;
              text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
			}
		</style>

    <script type="text/javascript" src="../js/3d/ThreeJsI.js"></script>
    <script type="text/javascript" src="../js/instafeed.js"></script>
    <script type="text/javascript" src="../js/Stats.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    	<section class=" col-md-offset-2 col-md-8 mt-5p" id="youTube">

        <!--TEXT INPUT-->
        <div class="control-group" style="margin-left: 362px;">
            <label class="mr-10 control-label" for="Instafeed">Recherche :</label>
            <div id="recherche" class="inlineB controls">
                <input id="Instafeed" name="instaTagsInput" type="text" placeholder="recherche" class="input-xlarge"/>
                <button onclick="validerRecherche(this);" type="button" class="add-on btn btn-success">Valider</button>
			</div>
        <!-- BOUTTON -->
        </div>      
        <!-- APPEL INSTAFEED  -->
        <div style="display:none;" id="instafeed" style="margin-left: 100px;"></div>
	</section>
	<div style="clear:both;"></div>
	<div id="3dViz"></div>
		<script>
		    function getUrlParams() {
		        var params = {};

		        if (location.search) {
		            var parts = location.search.substring(1).split('&');

		            for (var i = 0; i < parts.length; i++) {
		                var nv = parts[i].split('=');
		                if (!nv[0]) continue;
		                params[nv[0]] = nv[1] || true;
		            }
		        }
		        return params;
		    }
		    $(function () {
		        var urlParams = getUrlParams();

		        $(document).keypress(function (e) {
		            if (e.which == 13) {
		                //setFeed($("#Instafeed").val());
		                validerRecherche();
		            }
		        });

		        if (urlParams.tag == undefined) {
		            var feed = new Instafeed({
		                get: 'location',
		                get: 'popular',
		                clientId: '07980f6d793048ceb72d7f7441429cd8',
		                template: '<a href="{{link}}"><img src="{{image}}"></a>',
		                success: function (data) {
		                    for (var i = 0; i < data.data.length; i++) {
		                        var lienImage = data.data[i].images.thumbnail.url;
		                        arImgRotator.push(lienImage);
		                    }
		                    init();
		                    animate();
		                    $("#Instafeed").focus();

		                }
		            });
		            feed.run();
		        }
		        else {
		            setFeed(urlParams.tag);
		        }



		    });
		    var arImgRotator = new Array();
		    var container, stats;

		    var camera, scene, renderer, target;
		    var texture_placeholder;
		    var mouseX = 0, mouseY = 0;

		    var text, plane;

		    var targetRotation = 0;
		    var targetRotationOnMouseDown = 0;

		    var mouseX = 0;
		    var mouseXOnMouseDown = 0;

		    var windowHalfX = window.innerWidth / 2;
		    var windowHalfY = window.innerHeight / 2;

		    var radious = 1600, theta = 45, onMouseDownTheta = 45, phi = 60, onMouseDownPhi = 60, isShiftDown = false;

		    var particle;
		    var particles = [];
		    var particleImage = new Image();
		    //THREE.ImageUtils.loadTexture( "img/ParticleSmoke.png" );
		    particleImage.src = 'img/ParticleSmoke.png';


		    //////////////////////////////////////////////////////////////////////
		    //
		    // init
		    //
		    //////////////////////////////////////////////////////////////////////
		    function setFeed(tag) {
		        var feed = new Instafeed({
		            get: 'location',
		            get: 'tagged',
		            tagName: tag,
		            clientId: '07980f6d793048ceb72d7f7441429cd8',
		            template: '<a href="{{link}}"><span><img src="{{image}}"></span></a>',
		            success: function (data) {
		                for (var i = 0; i < data.data.length; i++) {
		                    var lienImage = data.data[i].images.thumbnail.url;
		                    arImgRotator.push(lienImage);
		                }
		                init();
		                animate();
		                $("#Instafeed").focus();
		            }
		        });
		        $("#instafeed").html("");
		        feed.run();
		    }

		    function validerRecherche() {
		        //var tag;
		        var inputVal = $("#Instafeed").val()
		        //setFeed(inputVal); 
		        location.replace("FlickrG.aspx?tag=" + inputVal);
		    }

		    function init() {

		        container = document.createElement('div');
		        //document.body.appendChild( container );
		        $("#3dViz").append(container);

		        var info = document.createElement('div');
		        info.style.position = 'absolute';
		        info.style.top = '10px';
		        info.style.width = '100%';
		        info.style.color = '#ffffff';
		        info.style.textAlign = 'center';

		        camera = new THREE.PerspectiveCamera(55, window.innerWidth / window.innerHeight, 10, 2500); // FlyCamera // FlyControls
		        camera.movementSpeed = 100.0;
		        camera.rollSpeed = 0.5;
		        camera.position.y = 60;
		        camera.position.z = 500;

		        scene = new THREE.Scene();

		        parent = new THREE.Object3D();
		        parent.position.y = 60;
		        scene.add(parent);





		        //////////////////////////////////////////////////////////////////////
		        //
		        // lights
		        //
		        //////////////////////////////////////////////////////////////////////

		        var light = new THREE.DirectionalLight(0xffffff);
		        light.position.set(10, 10, 11);
		        light.position.normalize();
		        parent.add(light);

		        pointLight = new THREE.PointLight(0xffffff, 0.9);
		        parent.add(pointLight);


		        ////////////////////////////////////////////////////////////////////////
		        //
		        // Generate 3D Planes in Radius circle
		        //
		        ////////////////////////////////////////////////////////////////////////


		        var materials = [

					loadTexture('img/ter.jpg'), // right

		        ];


		        /*
				 var arImgRotator = {
					"0":"12692071.png",
					"1":"Chrysanthemum.jpg",
					"2":"Desert.jpg",
					"3":"Hydrangeas.jpg",
					"4":"img2.jpg",
					"5":"Tulips.jpg",
					"6":"james.jpg",
					"7":"Jellyfish.jpg",
					"8":"Koala.jpg",
					"9":"Lighthouse.jpg",
					"10":"ParticleSmoke.png",
					"11":"Penguins.jpg"
				}
				*/
		        var camSize = 110;
		        var startAngle = 0;
		        var circleRadius = 230;
		        var diameter = circleRadius * 4;
		        var centerX = -5;
		        var centerZ = 0.5; // -2.5

		        var mpi = Math.PI / 180;
		        var startRadians = startAngle + mpi;
		        var totalSpheres = 12;
		        var incrementAngle = 360 / totalSpheres;
		        var incrementRadians = incrementAngle * mpi;

		        for (var i = 0; i < totalSpheres; i++) {

		            var xp = centerX + Math.sin(startRadians) * circleRadius;
		            var zp = centerZ + Math.cos(startRadians) * circleRadius;

		            var planObj = new THREE.Mesh(
						new THREE.PlaneGeometry(camSize, .95 * camSize),
						new THREE.MeshBasicMaterial({
						    map: THREE.ImageUtils.loadTexture(arImgRotator[i]),
						    doubleSided: false,
						    wireframe: false,
						    overdraw: true
						})


					);

		            planObj.position.x = xp;
		            planObj.position.z = zp;


		            planObj.rotation.y = i * incrementAngle * (Math.PI / 180.0); //MH - do this without degrees

		            startRadians += incrementRadians;
		            particles.push(planObj);
		            parent.add(planObj);


		        }

		        //////////////////////////////////////////////////////////////////////
		        //
		        //  Render 
		        //
		        //////////////////////////////////////////////////////////////////////

		        renderer = new THREE.CanvasRenderer({ /*antialias: true*/ }); // WebGLRenderer
		        renderer.setSize(window.innerWidth, window.innerHeight);
		        renderer.setClearColorHex(0x555555, 0.9);
		        container.appendChild(renderer.domElement);

		        //////////////////////////////////////////////////////////////////////
		        //
		        //  stats 
		        //
		        //////////////////////////////////////////////////////////////////////

		        stats = new Stats();
		        stats.domElement.style.position = 'absolute';
		        stats.domElement.style.top = '0px';
		        container.appendChild(stats.domElement);

		        //////////////////////////////////////////////////////////////////////
		        //
		        //  addEventListener 
		        //
		        //////////////////////////////////////////////////////////////////////

		        document.addEventListener('mousedown', onDocumentMouseDown, false);
		        document.addEventListener('touchstart', onDocumentTouchStart, false);
		        document.addEventListener('touchmove', onDocumentTouchMove, false);
		        document.addEventListener('mousewheel', onDocumentMouseWheel, false);

		        //document.addEventListener( 'mousemove', onDocumentMouseMove, false );
		        //document.addEventListener( 'mousedown', onDocumentMouseDown, false );
		        //document.addEventListener( 'mouseup', onDocumentMouseUp, false );

		        //document.addEventListener( 'mousedown', onDocumentMouseDown, false );
		        //document.addEventListener( 'touchstart', onDocumentTouchStart, false );
		        //document.addEventListener( 'touchmove', onDocumentTouchMove, false );


		        //document.addEventListener( 'touchstart', onDocumentTouchStart, false );
		        //document.addEventListener( 'touchmove', onDocumentTouchMove, false );
		        //document.addEventListener( 'keydown', onDocumentKeyDown, false );
		        //document.addEventListener( 'keyup', onDocumentKeyUp, false );
		        //document.addEventListener( 'mousemove', onDocumentMouseMove, false );
		        //document.addEventListener( 'mousedown', onDocumentMouseDown, false );
		        //document.addEventListener( 'mouseup', onDocumentMouseUp, false );
		        //document.addEventListener( 'mousewheel', onDocumentMouseWheel, false );

		        /*document.addEventListener( 'keydown', onDocumentKeyDown, false );
				document.addEventListener( 'keyup', onDocumentKeyUp, false );

				document.addEventListener( 'mousemove', onDocumentMouseMove, false );
				document.addEventListener( 'mousedown', onDocumentMouseDown, false );
				document.addEventListener( 'mouseup', onDocumentMouseUp, false );
				document.addEventListener( 'mousewheel', onDocumentMouseWheel, false );*/




		        //setInterval( loop, 500 / 60 );


		    }

		    //////////////////////////////////////////////////////////////////////
		    //
		    //  Mouse events
		    //
		    //////////////////////////////////////////////////////////////////////


		    function loadImage(path) {

		        var image = document.createElement('img');
		        var texture = new THREE.Texture(image, THREE.UVMapping)

		        image.onload = function () { texture.needsUpdate = true; };
		        image.src = path;

		        return texture;

		    }


		    //

		    function loop() {

		        for (var i = 0; i < particles.length; i++) {

		            var particle = particles[i];
		            particle.updatePhysics();

		            with (particle.position) {
		                if (y < -1000) y += 2000;
		                if (x > 1000) x -= 2000;
		                else if (x < -1000) x += 2000;
		                if (z > 1000) z -= 2000;
		                else if (z < -1000) z += 2000;
		            }
		        }

		        camera.position.x += (mouseX - camera.position.x) * 0.05;
		        camera.position.y += (-mouseY - camera.position.y) * 0.05;
		        camera.lookAt(scene.position);

		        renderer.render(scene, camera);


		    }

		    //////////////////////////////////////////////////////////////////////
		    //
		    //  loadTexture
		    //
		    //////////////////////////////////////////////////////////////////////

		    function loadTexture(path) {

		        var texture = new THREE.Texture(texture_placeholder);
		        var material = new THREE.MeshBasicMaterial({ map: texture, overdraw: true });

		        var image = new Image();
		        image.onload = function () {

		            texture.needsUpdate = true;
		            material.map.image = this;

		            render();

		        };
		        image.src = path;

		        return material;

		    }

		    //////////////////////////////////////////////////////////////////////
		    //
		    //  onDocumentMouseWheel
		    //
		    //////////////////////////////////////////////////////////////////////

		    function onDocumentMouseWheel(event) {

		        camera.position.x = Math.sin(theta * Math.PI / 360) * Math.cos(phi * Math.PI / 360);
		        camera.position.y = Math.sin(phi * Math.PI / 360);
		        camera.position.z = Math.cos(theta * Math.PI / 360) * Math.cos(phi * Math.PI / 360);
		        camera.updateMatrix();
		        render();

		        //counter == 30 ? scene.remove( directionalLight ) : counter ++;
		        camera.position.x += (mouseX - camera.position.x) * .05;
		        camera.position.y += (-mouseY - camera.position.y) * .05;
		        camera.lookAt(target);

		    }

		    function onDocumentMouseDown(event) {
		        event.preventDefault();

		        document.addEventListener('mousemove', onDocumentMouseMove, false);
		        document.addEventListener('mouseup', onDocumentMouseUp, false);
		        document.addEventListener('mouseout', onDocumentMouseOut, false);

		        mouseXOnMouseDown = event.clientX - windowHalfX;
		        targetRotationOnMouseDown = targetRotation;
		    }

		    //var r = 0, counter = 0;
		    function onDocumentMouseMove(event) {

		        mouseX = event.clientX - windowHalfX;
		        mouseY = event.clientY - windowHalfY;
		        targetRotation = targetRotationOnMouseDown + (mouseX - mouseXOnMouseDown) * 0.02;

		        camera.position.x = Math.sin(theta * Math.PI / 360) * Math.cos(phi * Math.PI / 360);
		        //counter == 30 ? scene.remove( directionalLight ) : counter ++;
		        render();

		    }

		    function onDocumentMouseUp(event) {
		        document.removeEventListener('mousemove', onDocumentMouseMove, false);
		        document.removeEventListener('mouseup', onDocumentMouseUp, false);
		        document.removeEventListener('mouseout', onDocumentMouseOut, false);
		    }

		    function onDocumentMouseOut(event) {
		        document.removeEventListener('mousemove', onDocumentMouseMove, false);
		        document.removeEventListener('mouseup', onDocumentMouseUp, false);
		        document.removeEventListener('mouseout', onDocumentMouseOut, false);
		    }

		    function onDocumentTouchStart(event) {
		        if (event.touches.length == 1) {
		            event.preventDefault();
		            mouseXOnMouseDown = event.touches[0].pageX - windowHalfX;
		            targetRotationOnMouseDown = targetRotation;
		        }
		    }

		    function onDocumentTouchMove(event) {

		        if (event.touches.length == 1) {
		            event.preventDefault();
		            mouseX = event.touches[0].pageX - windowHalfX;
		            targetRotation = targetRotationOnMouseDown + (mouseX - mouseXOnMouseDown) * 0.05;
		        }

		        //counter == 30 ? scene.remove( directionalLight ) : counter ++;
		        camera.position.x += (mouseX - camera.position.x) * .05;
		        camera.position.y += (-mouseY - camera.position.y) * .05;
		        camera.lookAt(target);

		    }

		    //

		    function animate() {
		        requestAnimationFrame(animate);
		        render();
		        stats.update();
		    }

		    function render() {

		        parent.rotation.y += (targetRotation - parent.rotation.y) * 0.05;
		        //parent.rotation.z = -0.05;
		        //camera.rotation.z = -0.05;

		        //parent.rotation.z += ( targetRotation - parent.rotation.z ) * 0.01 * (parseInt(Math.random()*2) - 1 | 1);
		        //console.log(parent.rotation.z)
		        renderer.render(scene, camera);
		    }

		</script>
   
</asp:Content>


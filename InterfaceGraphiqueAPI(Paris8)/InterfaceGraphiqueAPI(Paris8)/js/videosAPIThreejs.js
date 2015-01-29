var camera, scene, renderer;
var player;

var auto = true;

var Element = function (id,entry) {

    var dom = document.createElement('div');
    dom.style.width = 'inherit';
    dom.style.height = 'inherit';

    $(dom).draggable();

    var image = document.createElement('img');
    image.style.position = 'absolute';
    image.style.width = '480px';
    image.style.height = '360px';

    if (id == "youtube")
        image.src = entry.media$group.media$thumbnail[2].url;
    else if (id == "dailymotion")
        image.src = entry.thumbnail_url
    else if (id == "vimeo")
        image.src;

    dom.appendChild(image);

    var button = document.createElement('img');
    button.style.position = 'absolute';
    button.style.left = ((480 - 86) / 2) + 'px';
    button.style.top = ((360 - 61) / 2) + 'px';
    button.style.visibility = 'hidden';
    button.style.WebkitFilter = 'grayscale()';
    if (id == "youtube")
        button.src = 'data:image/png;base64,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';
    else if (id == "dailymotion")
        button.src = 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBhQMEREUDxQVEhIVFhAXFhMWGCIQGhUSGBwbFBUWFh4jHygqIyUlGRYeIDssLywpLC04FSAxRzwqOTIyLykBCQoKBQUFDQUFDSkYEhgpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKf/AABEIAE4AUAMBIgACEQEDEQH/xAAcAAADAQADAQEAAAAAAAAAAAAABwgFAQQGAgP/xAA/EAABAgMCBhADCAMAAAAAAAABAAIDBBEFEgYHCCExkhcYNDVBUVJUYXFyc4Gzw9ITFDIiIzNikbGy8YKh8P/EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwBx2zbMKQgvjTDgyG3SeEngAHCSkZa+UFMmK/5ZjGwqm6HNvGnASf6Xosol5bLytCRV0YeB+F/XiUgUDQ2wM/yYWqjbAz/JhaqV6EDQ2wM/yYWqjbAz/JhaqV6EDQ2wM/yYWqjbAz/JhaqV6EDdsbKAmfit+YbDdDJaCA27mrnoQcxp1hPiQnmTMJkWEbzHtDmnjBUVKmcRcy6JZYvuLrsV4FeAXIbqDxcT4lBh5Rm55TtRfTSCT9yjNzynai+mkEgF9XTStDTRXgrxL5TtxA2TCnZS0YUzDZFhuiQKteLw+l2ccR6dKBJrhOvDPJ+IvRLKfeGc/LRDn6obz+zv1SdtCzospEdDmIb4URuljwWEeB/4oOshCEHKpTEJvWe+f5cJTWqUxCb1nvn+XCQY+UZueU7UX00gk/cozc8p2ovppBIBPfJt/Bn+8gfxckQnvk2/gz/eQP4uQOZY2EmCMra0O5OQmxKfS76Xs7DhnH7LZXm8LsYEpYrazMQfEIq2Cz7cR3+PAOk0CBMYa4iZmSvRJAmbg6blKRmjq0P8KHo4Ur3NLSQRQioIOYg8IKYOGeOqctS9DgEykuai6w/ePH536fAUGfhS9JQCpTEJvWe+f5cJTWqUxCb1nvn+XCQY+UZueU7UX00gk/cozc8p2ovppBIBOTEZhNLWXKz8SbithN+JBpXO5xDXZmtGcnqSbQgbWGmPyPM3odmtMvD0fGdniuH5RoZ/s9I0JUx5h0VxdEcXvcauc43iTxknSvzQgEIQg5VKYhN6z3z/AC4SmtUpiE3rPfP8uEg7WN/AyJa8oDAzxIN9wh8sG6SB0/YHXU9CmSPAdCcWvBa4ZiDmVsrDtTAmTnH348vDc/PVwqwk8ZukV8UEfVRVVrsZWdzZus/3I2MrO5s3Wf7kElVRVVrsZWdzZus/3I2MrO5s3Wf7kElVRVVrsZWdzZus/wByNjKzubN1n+5BKMnJPmHhkJpc4kAAZ850KqsWeC7rIkIcKKfvHEvcOSS1rbv6MHiStOyMD5SRdel4DGO5WdxHUXE08FsoP//Z';
    else if (id == "vimeo")
        button.src = '';
    dom.appendChild(button);

    var blocker = document.createElement('div');
    blocker.style.position = 'absolute';
    blocker.style.width = '480px';
    blocker.style.height = '360px';
    blocker.style.background = 'rgba(0,0,0,0.5)';
    blocker.style.cursor = 'pointer';
    dom.appendChild(blocker);

    var object = new THREE.CSS3DObject(dom);
    object.position.x = Math.random() * 4000 - 2000;
    object.position.y = Math.random() * 2000 - 1000;
    //object.position.y = 3000;
    object.position.z = Math.random() * -5000;

    //

    image.addEventListener('load', function (event) {

        button.style.visibility = 'visible';

        new TWEEN.Tween(object.position)
            .to({ y: Math.random() * 2000 - 1000 }, 2000)
            .easing(TWEEN.Easing.Exponential.Out)
            .start();

    }, false);

    dom.addEventListener('mouseover', function () {

        button.style.WebkitFilter = '';
        blocker.style.background = 'rgba(0,0,0,0)';

    }, false);

    dom.addEventListener('mouseout', function () {

        button.style.WebkitFilter = 'grayscale()';
        blocker.style.background = 'rgba(0,0,0,0.75)';

    }, false);

    dom.addEventListener('click', function (event) {

        event.stopPropagation();

        auto = false;

        if (player !== undefined) {

            player.parentNode.removeChild(player);
            player = undefined;

        }

        player = document.createElement('iframe');
        player.style.position = 'absolute';
        player.style.width = '480px';
        player.style.height = '360px';
        player.style.border = '0px';
        if (id == "youtube")
            player.src = 'http://www.youtube.com/embed/' + entry.id.$t.split('/').pop() + '?rel=0&autoplay=1&controls=1&showinfo=0';
        else if (id == "dailymotion")
            player.src = 'http://www.dailymotion.com/embed/video/' + entry.id + '?api=true&autoplay=1&controls=1&showinfo=0';
        else if (id = "vimeo")
            player.src;
        
        $(player).draggable();
        this.appendChild(player);

        //

        var prev = object.position.z + 400;

        new TWEEN.Tween(camera.position)
            .to({ x: object.position.x, y: object.position.y - 25 }, 1500)
            .easing(TWEEN.Easing.Exponential.Out)
            .start();

        new TWEEN.Tween({ value: prev })
            .to({ value: 0 }, 2000)
            .onUpdate(function () {

                move(this.value - prev);
                prev = this.value;

            })
            .easing(TWEEN.Easing.Exponential.Out)
            .start();

    }, false);

    return object;

};

init();
animate();

function init() {

    camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 5000);
    camera.position.y = -25;

    scene = new THREE.Scene();

    renderer = new THREE.CSS3DRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.domElement.style.position = 'absolute';
    renderer.domElement.style.top = 0;
    document.getElementById('vueGraphiqueV').appendChild(renderer.domElement);

    //

    var query = document.getElementById('videosInput');
    query.addEventListener('keyup', function (event) {

        if (event.keyCode === 13) {

            //search(query.value);

        }

    }, false);

    var button = document.getElementById('button');
    button.addEventListener('click', function (event) {

        //search(query.value);

    }, false);

    if (window.location.hash.length > 0) {

        query.value = window.location.hash.substr(1);

    }

    //search(query.value);

    document.body.addEventListener('mousewheel', onMouseWheel, false);

    document.body.addEventListener('click', function (event) {

        auto = true;

        if (player !== undefined) {

            player.parentNode.removeChild(player);
            player = undefined;

        }

        new TWEEN.Tween(camera.position)
                .to({ x: 0, y: -25 }, 1500)
                .easing(TWEEN.Easing.Exponential.Out)
                .start();

    }, false);

    window.addEventListener('resize', onWindowResize, false);

}

//function search(query) {

//    window.location.hash = query;

//    for (var i = 0, l = scene.children.length; i < l; i++) {

//        (function () {

//            var object = scene.children[i];
//            var delay = i * 15;

//            new TWEEN.Tween(object.position)
//                .to({ y: -2000 }, 1000)
//                .delay(delay)
//                .easing(TWEEN.Easing.Exponential.In)
//                .onComplete(function () {

//                    scene.remove(object);

//                })
//                .start();

//        })();

//    }

//    var request = new XMLHttpRequest();
//    request.addEventListener('load', onData, false);
//    request.open('GET', 'https://gdata.youtube.com/feeds/api/videos?v=2&alt=json&max-results=50&q=' + query, true);
//    request.send(null);

//}

function setDataOnVueGraphique(data,id) {

    var entries;

    if (id == "youtube") {
        entries = data.feed.entry;
    }
    else if (id == "dailymotion") {
        entries = data.list;
    }
    else if (id == "vimeo") {

    }
    

    // console.log( entries );

    for (var i = 0; i < entries.length; i++) {

        (function (data, time) {

            setTimeout(function () {

                scene.add(new Element(id,data));

            }, time);

        })(entries[i], i * 15);

    }

}

function move(delta) {

    for (var i = 0; i < scene.children.length; i++) {

        var object = scene.children[i];

        object.position.z += delta;

        if (object.position.z > 0) {

            object.position.z -= 5000;

        } else if (object.position.z < -5000) {

            object.position.z += 5000;

        }

    }

}

function onMouseWheel(event) {

    move(event.wheelDelta);

}

function onWindowResize() {

    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    renderer.setSize(window.innerWidth, window.innerHeight);

}

function animate() {

    requestAnimationFrame(animate);

    TWEEN.update();

    if (auto === true) {

        move(1);

    }

    renderer.render(scene, camera);

}

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Facebook.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.Facebook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    

</html>
<!DOCTYPE html>
<html lang="en">

<style>
    .form_input {
        padding:7px;
	    margin:6px;
            }
    .cadre {
        padding:5px;
        width:300px;
        margin:auto; 
        border:8px solid #4aa3df; 
        -moz-border-radius:20px; 
        -khtml-border-radius:20px; 
        -webkit-border-radius:20px; 
        border-radius:20px;
    }
</style>

<head>
  <meta charset="utf-8"/>
  <title>Bootstrap 3, from LayoutIt!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link href="css/style.css" rel="stylesheet"/>

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="img/favicon.png">
  
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</head>


<body>

<!------------------------------------------------Facebook Connect------------------------------------------->

   <div id="fb-root"></div>
<script src="http://connect.facebook.net/fr_FR/all.js"></script>
<script>
    FB.init({
        appId: '1564205337127840',
        status: true, // verifie le statut de la connexion
        cookie: true, // active les cookies pour que le serveur puisse accéder à la session
        xfbml: true  // active le XFBML (HTML de Facebook)
    });

    // Cas où le user est déconnecter et donc pour lui donner la possibilité de taper son login et mdp
    $(document).ready(function() {
        FB.Event.subscribe('auth.login', function(response) {
            // Code à executer lorsque l'utilisateur se connecte
        });
    });

    //Pour récupérer les informations basiques de l'utilisateur
    FB.Event.subscribe('auth.login', function (response) {

        FB.api('/me', function (response) {
            //Affiche de l'image fb du user
            var url = 'http://graph.facebook.com/' + response.id + '/picture';

            $('#facebook_profile_image').html('<img src="' + url + '" alt="#" />');
            $('#facebook_profile_text').html('<p><a href="' + response.link + '"><strong>' + response.name + '</strong></a><br /><a href="#" id="facebook_logout">Deconnexion</a>');

            //
            var user_data = '<ul><li>Votre date de naissance : ' + response.birthday + '</li><li>Votre adresse email : ' + response.email + '</li><li>Votre bio : ' + response.bio + '</li>';
            $('#facebook_user_data').html(user_data);
        });

    });

   
</script>


<!------------------------------------------------Fin Facebook Connect--------------------------------------->

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-pills">
				<li class="active">
					<a href="index.aspx">Acceuil</a>
				</li>
				<li class="active">
					<a href="#">Explication</a>
				</li>          			
			</ul>
		</div>
	</div>

      <div align="center" class="cadre" style="margin-top: 104px;
">
           <form action="#" style="padding-top: 14px;">
	           <!--<h1 style="font-style: italic; font-size: 25px; color:GREY; margin-left: 40px;">Se connecter</h1>-->
                    <div class="form_input">
                         <label>Adresse e-mail</label></br>
                         <input type="text" name="email"/>
                    </div>      
							
				    <div class="form_input">
                         <label>Mot de passe</label></br>
                         <input type="text" name="mdp" />
                    </div>  
						
					<!--<input class="form_input" name="submit" style='width:200px; color:white; background-color:#181818 ' type="submit" value="Se connecter" />-->
                    <!-- Boutton facebook--->
                    <div class="box">
                            <div id="social_networks">
                                <div id="facebook_button_box">
                                    <fb:login-button show-faces="true" width="450" perms="email,user_birthday,read_stream"></fb:login-button>
                                </div>
                            </div>
                            <div id="social_networks_profiles">
                                <div id="facebook_profile" style="display:none;">
                                    <div id="facebook_profile_image" style="width:50px;height:50px;margin-left:20px;float:left;">

                                    </div>
                                    <div id="facebook_profile_text" style="height:50px;margin-top:-3px;margin-left:5px;float:left">

                                    </div>
                                    <div class="clear"></div>
                                    <ul id="facebook_user_data">

                                    </ul>
                             </div>
                                <div class="clear"></div>
                            </div>
                       </div>
                     <!-- Fin Boutton facebook--->
           </form>
      </div>
</div>
</body>
</html>

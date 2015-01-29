<%@ Page Title="videosAPI" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="youTube.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script src="http://api.dmcdn.net/all.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" Runat="Server">

    <a href="" id="theme-setting-icon" class="youtube" ><i class="fa fa-cog fa-lg"></i></a>
    <div id="theme-setting" >
		<div class="title youtube">
			<strong class="no-margin">Choix API</strong>
		</div>
		<div class="theme-box">
			<i onclick="changeApi(this);" class="active pointer col-md-4 fa fa-youtube" style="font-size:30px;color: rgb(169, 68, 66);" id="youtube-skin"></i>
			<%--<i onclick="changeApi(this);" class="pointer col-md-4 fa fa-vimeo-square" style="font-size:30px;color: rgb(23, 179, 232);"  id="vimeo-skin"></i>--%>
			<i onclick="changeApi(this);" class="text-center pointer col-md-4" id="dailymotion-skin"><img src="../img/dailymotion-logo.png" alt="dailymotion"></i>
		</div>
	</div>
         
    <div id="videosModele" class="displayNone row col-md-12 no-margin">
        <li class="text-center">
            <a href="#">
	            <iframe width="180" id="urlY" frameborder="0" allowfullscreen></iframe>
	            <div class="quick-detail">
		            <h5 id="titreY"></h5>
		            <p id="descriptionY"></p>
	            </div>
            </a>
        </li>
    </div>
    <section class=" col-md-offset-2 col-md-8 mt-5p" id="youTube">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div id="titleVideos" class="text-center">
                        <h2>API <span class="youtube">YouTube</span></h2>
                        <p class="lead">Récupération de vidéos grâce à l'API <span class="youtube">YouTube.</span> </p>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <div class="clear"></div>
        <!-- /.container -->
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="text-center">
                        <!-- Text input-->
                        <div class="control-group">
                            <h4 id="titleRecherche" class="col-md-12">Recherche de Vidéos <span class="youtube">YouTube</span></h4>
                            <div class=" col-md-offset-2 col-md-8">
                                <div class="input-group">
							        <input id="videosInput" type="text" class="form-control input-sm">
							        <div class="input-group-btn">
							            <button id="button" onclick="getVideos();" type="button" class="btn btn-sm btn-success" tabindex="-1">Chercher</button>
							        </div> <!-- /input-group-btn -->
							    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <div class="clear"></div>
        <div id="youTubeResultPanel" class="displayNone youtube panel panel-default">
	        <div class="panel-tab clearfix">
		        <ul class="tab-bar">
			        <li class="active"><a href="#vueBasique" data-toggle="tab"><i class="fa fa-youtube"></i> Vue Basique</a></li>
			        <li class=""><a onclick="GetVueGraphique();" href="#vueGraphiqueV" data-toggle="tab"><i class="fa fa-paint-brush"></i> Vue Graphique</a></li>
		        </ul>
	        </div>
	        <div class="panel-body">
		        <div class="tab-content">
			        <div class="tab-pane fade active in" id="vueBasique">
				        <div class="jcarousel-wrapper">
			                <div class="jcarousel movie-jcarousel" data-jcarousel="true">
				                <ul id="videoContainer">

				                </ul>
			                </div>

			                <a href="#" class="jcarousel-control-prev" data-jcarouselcontrol="true" onclick="Caroussel('previous');">‹</a>
			                <a href="#" class="jcarousel-control-next" data-jcarouselcontrol="true" onclick="Caroussel('next');">›</a>
		                </div>
			        </div>
			        <div class="col-md-12 tab-pane youtube fade" id="vueGraphiqueV">
				        
			        </div>
                    <div class="clear"></div>
		        </div>
	        </div>
        </div>
    </section>
        
     <!-- Three.js -->
        <script type="text/javascript" src="../js/3d/three.min.js"></script>
        <script type="text/javascript" src="../js/3d/tween.min.js"></script>
        <script type="text/html" src="../js/3d/CSS3DRenderer.js"></script>

        <script type="text/javascript" src="/js/videosAPI.js"></script>
        <script type="text/javascript" src="/js/videosAPIThreejs.js"></script>

</asp:Content>


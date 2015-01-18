<%@ Page Title="YouTube" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="youTube.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" Runat="Server">
         
    <div id="youTubeModele" class="displayNone row col-md-12 no-margin">
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
    <section class=" col-md-offset-2 col-md-8 mt-10" id="youTube">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="text-center">
                        <h2>API YouTube</h2>
                        <p class="lead">Récupération de vidéos grâce à l'API Youtube. </p>
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
                            <label class="control-label col-md-12" for="Tweetradios">Recherche de Vidéos YouTube</label>
                            <div class=" col-md-offset-2 col-md-8">
                                <div class="input-group">
							        <input id="youTubeInput" type="text" class="form-control input-sm">
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
        <div id="youTubeResultPanel" class="displayNone panel panel-default">
	        <div class="panel-tab clearfix">
		        <ul class="bg-danger tab-bar">
			        <li class="active"><a href="#vueBasique" data-toggle="tab"><i class="fa fa-youtube"></i> Vue Basique</a></li>
			        <li class=""><a onclick="GetVueGraphique();" href="#vueGraphiqueY" data-toggle="tab"><i class="fa fa-paint-brush"></i> Vue Graphique</a></li>
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
			        <div class="col-md-12 tab-pane fade" id="vueGraphiqueY">
				        
			        </div>
                    <div class="clear"></div>
		        </div>
	        </div>
        </div>
    </section>
        
     <!-- Three.js -->
        <script type="text/javascript" src="../js/three.min.js"></script>
        <script type="text/javascript" src="../js/tween.min.js"></script>
        <script type="text/html" src="../js/CSS3DRenderer.js"></script>

        <script type="text/javascript" src="/js/youtube.js"></script>
        <script type="text/javascript" src="/js/youTubeThreejs.js"></script>

</asp:Content>


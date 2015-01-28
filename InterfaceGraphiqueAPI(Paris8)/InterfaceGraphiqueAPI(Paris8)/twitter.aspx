<%@ Page Title="Twitter" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="twitter.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/twitter.css" rel="stylesheet" />
    <%--<script src="js/twitterDatGui.js"></script>--%>
    <script src="js/twitter.js"></script>
    <script src="js/twitterProcessing.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div id="tweetsModele" class="displayNone row col-md-12 no-margin">
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="tweetHeader">
                    <span class="pull-left" id="userImg"><img src="#" alt="image user" /></span>
                    <b><span class="pull-left text-info" id="userTweet"></span></b>
                    <span class="pull-left" id="dateTweet"></span>
                    <span class="pull-left" id="followers"></span>
                    <span class="pull-right" id="geoloc"></span>    
                </div>
                <div class="ml-20 col-md-9 p-10" id="tweetBody"></div>
                <div class="pull-right col-md-12" id="tweetbuttons"></div>
            </div>
        </div>
    </div>
    <section class=" col-md-offset-2 col-md-8 mt-5p" id="twitter">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="text-center">
                        <h2>API Twitter</h2>
                        <p class="lead">Récupération de différentes données grâce à l'API Twitter. </p>
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
                        <!-- Multiple Radios (inline) -->
                        <div class="control-group">
                          <label class="control-label" for="Tweetradios">Recherche de Tweets</label>
                          <div id="tweetRadios" class="controls">
                            <label class="inlineB mr-30 radio inline" for="Tweetradios-0">
                              <input type="radio" name="Tweetradios" id="Tweetradios-0" value="Envoyés par" checked="checked"/>
                              Envoyés par
                            </label>
                            <label class="inlineB mr-30 radio inline" for="Tweetradios-1">
                              <input type="radio" name="Tweetradios" id="Tweetradios-1" value="Reçus par"/>
                              Reçus par
                            </label>
                            <label class="inlineB mr-30 radio inline" for="Tweetradios-2">
                              <input type="radio" name="Tweetradios" id="Tweetradios-2" value="Contenant le #"/>
                              Contenant le #
                            </label>
                            <label class="inlineB mr-30 radio inline" for="Tweetradios-3">
                              <input type="radio" name="Tweetradios" id="Tweetradios-3" value="Contenant le @"/>
                              Contenant le @
                            </label>
                          </div>
                        </div>

                        <!-- Text input-->
                        <div class="control-group">
                          <label class="mr-10 control-label" for="tweetsInput">Recherche :</label>
                          <div class="inlineB controls">
                            <input id="tweetsInput" name="tweetsInput" type="text" placeholder="recherche" class="input-xlarge"/>
                          </div>
                        </div>
                        <div class="pull-right mt-20 mr-20 control-group">
                            <button onclick="validerRecherche(this);" type="button" class="add-on btn btn-success">Valider</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <div class="clear"></div>
        <%--<div id="tweetsResultPanel" class="displayNone panel panel-info">
            <div class="panel-body">
                <div class="row">
                    <div id="content">
                    </div>
                </div>
            </div>
        </div>--%>
        <div id="tweetsResultPanel" class="displayNone panel panel-default">
	        <div class="panel-tab clearfix">
		        <ul class="bg-twitter tab-bar">
			        <li class="active"><a href="#vueBasique" data-toggle="tab"><i class="fa fa-twitter"></i> Vue Basique</a></li>
			        <li class=""><a onclick="GetVueGraphique('processing');" href="#vueProcessing" data-toggle="tab"><i class="fa fa-paint-brush"></i> Vue Processing.js</a></li>
		             <li class=""><a onclick="GetVueGraphique('d3');" href="#vueD3" data-toggle="tab"><i class="fa fa-connectdevelop"></i> Vue D3.js</a></li>
                </ul>
	        </div>
	        <div class="panel-body">
		        <div class="tab-content">
			        <div class="tab-pane fade active in" id="vueBasique">
				
			        </div>
			        <div class="tab-pane fade" id="vueProcessing">
				        <canvas class="col-md-12" id="vueGraphiqueCanvas"></canvas>
			        </div>
                    <div class="tab-pane fade" id="vueD3">

                            <div class="col-md-12" id="vis"></div>
                            <div class="clear" id="status"></div>
                            <div class=" col-md-6 panel panel-default" id="controls">
                                <div id="titreGigue" class="panel panel-heading">Sensibilité</div>
                                <div class="panel panel-body" id="jitter" oninput="output.value = (jitter_input.value / 200).toFixed(3)" >
                                   <%-- <input id="jitter_input" type="range" min="0" max="400" value="100" style="width:240px;">
                                    <output name="output" for="input">0.5</output>--%>
                                    <p>
                                      <label for="input"></label>
                                      <input type="text" id="jitter_input" readonly style="border:0; color:#3C464E; font-weight:bold;">
                                    </p>
 
                                    <div id="jitter-div"></div>
                                </div>
                            </div>
                            <div class=" col-md-6 panel panel-default" id="changeData">
                                 <div class="control-group">
                                  <div class="panel panel-heading bg-twitter">Changer les données</div>
                                  <div id="dataChangeRadios" class="panel panel-body">
                                    <label class="inlineB mr-30 radio inline" for="dataRadio-0">
                                      <input type="radio" name="dataRadio" id="dataRadio-0" value="Tweets" checked="checked"/>
                                      Tweets
                                    </label>
                                    <label class="inlineB mr-30 radio inline" for="dataRadio-1">
                                      <input type="radio" name="dataRadio" id="dataRadio-1" value="Reçus par"/>
                                      Logins
                                    </label>
                                  </div>
                                </div>
                            
                            </div>
			        </div>
		        </div>
	        </div>
        </div>
    </section>
    <script type="text/javascript" src="js/3d/d3.min.js"></script>
    <script type="text/javascript" src="js/3d/coffee-script.js"></script>
     <script type="text/javascript" src="js/twitterD3.js"></script>
</asp:Content>

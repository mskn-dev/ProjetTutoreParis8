<%@ Page Title="Twitter" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="twitter.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/twitter.css" rel="stylesheet" />
    <script src="js/twitterDatGui.js"></script>
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
    <section class="col-md-9 mt-10" id="twitter">
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
		        <ul class="bg-info tab-bar">
			        <li class="active"><a href="#vueBasique" data-toggle="tab"><i class="fa fa-twitter"></i> Vue Basique</a></li>
			        <li class=""><a onclick="GetVueGraphique();" href="#vueGraphique" data-toggle="tab"><i class="fa fa-paint-brush"></i> Vue Graphique</a></li>
		        </ul>
	        </div>
	        <div class="panel-body">
		        <div class="tab-content">
			        <div class="tab-pane fade active in" id="vueBasique">
				
			        </div>
			        <div class="tab-pane fade" id="vueGraphique">
				        <canvas width="900" height="900" class="col-md-12" id="vueGraphiqueCanvas"></canvas>
			        </div>
		        </div>
	        </div>
        </div>
    </section>
    
</asp:Content>

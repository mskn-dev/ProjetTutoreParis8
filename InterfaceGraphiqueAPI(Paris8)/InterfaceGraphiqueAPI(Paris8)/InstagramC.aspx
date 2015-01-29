<%@ Page Title="InstagramC" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="instagram.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       @import url(http://fonts.googleapis.com/css?family=Lato);


        body {
            background: #EDEDED;
        }
        h1 {
              text-align: center;
              font-family: 'Lato';
              font-size: 36px;
              padding: 20px;
              font-weight: bold;
              color: #4F4F4F;
              text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }

        img {
              border-radius: 10px;
              border: 1px solid #DEDEDE;
              box-shadow: 1px 1px 3px rgba(0,0,0,0.3);
              width: 250px;
              height: 250px;
              margin: 0px 20px 20px 0px; 
              align-content: center;     
        }

    </style>

    <script type="text/javascript" src="../js/3d/ThreeJsI.js"></script>
    <script type="text/javascript" src="../js/instafeed.js"></script>
    <script type="text/javascript" src="../js/Stats.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    	<section class=" col-md-offset-2 col-md-8 mt-5p" id="instagramC">

          <div id="fb-root"></div>

    <section class="body">
    <div class="container">
	

      <div >
           <h1>INSTAGRAM API</h1>
      </div>

        <!--TEXT INPUT-->
        <div class="control-group" style="margin-left: 430px;">
            <label class="mr-10 control-label" for="Instafeed">Recherche :</label>
            <div class="inlineB controls">
                <input id="Instafeed" name="instaTagsInput" type="text" placeholder="recherche" class="input-xlarge"/>
                <button onclick="validerRecherche(this);" type="button" class="add-on btn btn-success">Valider</button>
        </div>
        <!-- BOUTTON -->
        </div>
            <div class="pull-right mt-20 mr-20 control-group" style="margin-right: 352px;">
            
        </div>
        </br></br>      
        <!-- APPEL INSTAFEED -->
        <div id="instafeed" style="margin-left: 100px;"></div>  
</div>
</section>
	</section>
	
  <script type="text/javascript">
      var feed = new Instafeed({
          get: 'location',
          get: 'popular',
          clientId: '07980f6d793048ceb72d7f7441429cd8',
          template: '<a href="{{link}}"><span><img src="{{image}}"></span></a>'
      });
      feed.run();


      function validerRecherche(div) {
          var tag;
          var inputVal = $("#Instafeed").val()
          setFeed(inputVal);
      }

      function setFeed(tag) {
          var feed = new Instafeed({
              get: 'location',
              get: 'tagged',
              tagName: tag,
              clientId: '07980f6d793048ceb72d7f7441429cd8',
              template: '<a href="{{link}}"><span><img src="{{image}}"></span></a>'
          });
          $("#instafeed").html("");
          feed.run();
      }


      //-----------------Load more photos-------------------//
      //var loadButton = document.getElementById('load-more');
      //var feed = new Instafeed({
      //     //every time we lead more, run this function
      //   after: function () {
      //disable button if no more results to load
      //       if (!this.hasNext()) {
      //            loadButton.setAttribute('disabled', 'disabled');
      //       }
      //    },
      // });
      //blind the load more button
      // loadButton.addEventListener('click', function () {
      //   feed.next();
      // });
      //run our feed
      //feed.run();
      /////--------------Fin load more photos--------------------------////

  </script>
   
</asp:Content>


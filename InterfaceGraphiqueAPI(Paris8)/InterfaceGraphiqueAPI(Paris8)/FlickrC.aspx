<%@ Page Title="FlickrC" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="FlickrC.aspx.vb" Inherits="FlickrC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    	<section class=" col-md-offset-2 col-md-8 mt-5p" id="instagramC">

          <div id="fb-root"></div>

    <section class="body">
    <div class="">

      
           <h1>FLICKR API</h1>
     <div class="control-group" style="margin-left: 303px;">
        <input id="monTexte" type="text" placeholder="recherche" class="input-xlarge" >
         <button class="add-on btn btn-success">envoyer</button>
     </div>
    <div id="photos"></div>
        
       
</div>
</section>

            <br/>
        <br/>
	</section>
	
  <script type="text/javascript">
      
      $(document).ready(function () {
          

          $('button').click(function () {

              var jsonURL = 'http://api.flickr.com/services/feeds/photos_public.gne?tags=';
              var formatJSON = '&tagmode=ANY&format=json&jsoncallback=?';
              var monTag = $('#monTexte').val();

              var adresseComplete = jsonURL + monTag + formatJSON;

              var monTexte =

              $.getJSON(adresseComplete, function (data) {

                  $.each(data.items, function (i, photo) {

                      var photoHTML = '<span>';

                      photoHTML += '<img src="' + photo.media.m.replace('_m', '_s') + '"></span>';

                      $('#photos').append(photoHTML);

                  });

              });
          });
      });
  </script>
   
</asp:Content>


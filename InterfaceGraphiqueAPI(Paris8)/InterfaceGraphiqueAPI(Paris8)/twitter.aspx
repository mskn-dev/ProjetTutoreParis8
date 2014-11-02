<%@ Page Title="Twitter" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="twitter.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/twitter.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <section class="col-md-9" id="twitter">
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
    </section>
</asp:Content>

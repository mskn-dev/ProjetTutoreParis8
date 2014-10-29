<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="testTwo.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">

    <div id="draw">
        <div class="two-container"></div>
    </div>
    <script>
        var elem = document.getElementById('draw').children[0];
        var two = new Two({ width: 285, height: 200 }).appendTo(elem);

        var circle = two.makeCircle(-70, 0, 50);
        var rect = two.makeRectangle(70, 0, 100, 100);
        circle.fill = '#FF8000';
        rect.fill = 'rgba(0, 200, 255, 0.75)';

        var group = two.makeGroup(circle, rect);
        group.translation.set(two.width / 2, two.height / 2);
        group.scale = 0;
        group.noStroke();
        two.bind('update', function (frameCount) {
            if (group.scale > 0.9999) {
                group.scale = group.rotation = 0;
            }
            var t = (1 - group.scale) * 0.125;
            group.scale += t;
            group.rotation += t * 4 * Math.PI;
        }).play();
    </script>

</asp:Content>

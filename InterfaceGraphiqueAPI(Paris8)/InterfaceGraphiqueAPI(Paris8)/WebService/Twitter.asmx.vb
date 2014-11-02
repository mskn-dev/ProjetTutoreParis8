Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' Pour autoriser l'appel de ce service Web depuis un script à l'aide d'ASP.NET AJAX, supprimez les marques de commentaire de la ligne suivante.
<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class Twitter
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetAllTweets() As LinqToTwitter.Status()
        Dim Twitter As New Twitter()
        Return Twitter.GetAllTweets()
    End Function

End Class
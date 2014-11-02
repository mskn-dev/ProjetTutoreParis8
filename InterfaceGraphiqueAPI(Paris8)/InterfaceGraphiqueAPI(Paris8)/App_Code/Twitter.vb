Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' Pour autoriser l'appel de ce service Web depuis un script à l'aide d'ASP.NET AJAX, supprimez les marques de commentaire de la ligne suivante.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class Twitter
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetAllTweets(tag As String) As Tweets()
        Dim Twitter As New TwitterData()
        Return Twitter.GetTweetsFromTags(tag)
    End Function

End Class

Public Class Tweets
    Public Property userName As String
    Public Property tweetText As String
    Public Property tweetDate As Date
End Class

Public Class TwitterData

    Private Property Credential As LinqToTwitter.ICredentialStore
    Private Property Auth As LinqToTwitter.PinAuthorizer

    

    Public Sub New()

        Me.Credential = New LinqToTwitter.InMemoryCredentialStore

        Credential.ConsumerKey = "GXlXGn2EFeBfhg5xf4bH4RzLW"
        Credential.ConsumerSecret = "m8dk9mOcghk1n4GxyC0gKblafW8k49hWVCVAJ5CncfRFzQtZuF"
        Credential.OAuthToken = "97215738-uPPeYu0kCPLGmeH4SFPPG1Y6mm96ZuCxDZNO9yTXb"
        Credential.OAuthTokenSecret = "pp1SWEhlnPwLJRjguJdn2gBXd6OPufbQ1xs8UBQYId6nK"

        Me.Auth = New LinqToTwitter.PinAuthorizer
        Auth.CredentialStore = Credential
        Auth.AuthorizeAsync()

    End Sub

    Public Function GetTweetsFromTags(Tag As String) As Tweets()

        Dim tousLesTweets As New List(Of Tweets)


        Using Service As LinqToTwitter.TwitterContext = New LinqToTwitter.TwitterContext(Me.Auth)

            Dim results = (From search In Service.Search _
                Where search.Type = LinqToTwitter.SearchType.Search _
                And search.Query = Tag And search.SearchLanguage = "fr" Select search).ToList

            'Dim tweets = (From tweet In results(0).Statuses _
            '             Where tweet.Type = LinqToTwitter.StatusType.User _
            '                   And tweet.ExcludeReplies = True _
            '             Select tweet).ToList

            'If tweets.Count > 0 Then tousLesTweets.AddRange(tweets)

            For Each i In results(0).Statuses
                Dim tweet As New Tweets
                tweet.userName = i.User.Name
                tweet.tweetDate = i.CreatedAt
                tweet.tweetText = i.Text
                tousLesTweets.Add(tweet)
            Next

        End Using

        Return tousLesTweets.ToArray()
    End Function
End Class



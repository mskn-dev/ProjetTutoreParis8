Public Class Twitter

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

    Public  Function GetTweetsFromTags(Tag As String) As LinqToTwitter.Status()

        Dim tousLesTweets As New List(Of LinqToTwitter.Status)

        Using Service As LinqToTwitter.TwitterContext = New LinqToTwitter.TwitterContext(Me.Auth)

            Dim results = (From search In Service.Search _
                Where search.Type = LinqToTwitter.SearchType.Search _
                And search.Query = Tag And search.SearchLanguage = "fr" Select search).ToList

            Dim tweets = (From tweet In results(0).Statuses _
                         Where tweet.Type = LinqToTwitter.StatusType.User _
                               And tweet.ExcludeReplies = True _
                         Select tweet).ToList

            If tweets.Count > 0 Then tousLesTweets.AddRange(tweets)

        End Using

        Return tousLesTweets.ToArray()
    End Function
End Class

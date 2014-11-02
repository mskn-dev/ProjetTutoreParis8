Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim Credential As LinqToTwitter.ICredentialStore = New LinqToTwitter.InMemoryCredentialStore

        'Credential.ConsumerKey = "GXlXGn2EFeBfhg5xf4bH4RzLW"
        'Credential.ConsumerSecret = "m8dk9mOcghk1n4GxyC0gKblafW8k49hWVCVAJ5CncfRFzQtZuF"
        'Credential.OAuthToken = "97215738-uPPeYu0kCPLGmeH4SFPPG1Y6mm96ZuCxDZNO9yTXb"
        'Credential.OAuthTokenSecret = "pp1SWEhlnPwLJRjguJdn2gBXd6OPufbQ1xs8UBQYId6nK"

        'Dim Auth As LinqToTwitter.PinAuthorizer = New LinqToTwitter.PinAuthorizer
        'Auth.CredentialStore = Credential
        'Auth.AuthorizeAsync()

        ' ''*** Define a list of screen names to check for public tweets. ***
        ''Dim screenNames As String = "Daphne_Burki01"

        ' ''*** Define a cutoff date, e.g., 1-day old. ***
        'Dim cutoffDate As Date = Now.Subtract(New TimeSpan(1, 0, 0, 0))

        ' ''*** This is to remove the time from the date. ***
        'cutoffDate = cutoffDate.Date

        'Using Service As LinqToTwitter.TwitterContext = New LinqToTwitter.TwitterContext(Auth)

        '    Dim results = (From search In Service.Search _
        '        Where search.Type = LinqToTwitter.SearchType.Search _
        '        And search.Query = "from:psg_inside" And search.SearchLanguage = "fr" Select search).ToList

        '        '*** Instantiate a master list of tweets. ***
        '    Dim allTweets As New List(Of LinqToTwitter.Status)

        '    '*** Need to check one screen name at a time. ***
        '    'For Each s As String In screenNames.Split(",")

        '    'Dim screenName As String = s.Trim

        '    'If String.IsNullOrEmpty(screenName) = False Then

        '    'For Each i In results(0).Statuses
        '    '    Dim bobo = i.
        '    'Next
        '    '*** Get a list of 1 day old public tweets for a given user. ***
        '    '*** Exclude all replies. ***
        '    Dim tweets = (From tweet In results(0).Statuses _
        '                  Where tweet.Type = LinqToTwitter.StatusType.User _
        '                        And tweet.CreatedAt.ToLocalTime >= cutoffDate _
        '                        And tweet.ExcludeReplies = True _
        '                  Select tweet).ToList

        '    '*** Add tweets to the master list. ***
        '    If tweets.Count > 0 Then allTweets.AddRange(tweets)

        '    'End If

        '    'Next

        '    '*** Display all the tweets from newest to oldest. ***
        '    For Each tweet In allTweets.OrderByDescending(Function(a) a.CreatedAt)
        '        Page.Response.Write(String.Format("{0}<br />[{1}] {2}<br/><br/>", _
        '                                          tweet.CreatedAt.ToLocalTime.ToString, _
        '                                          tweet.ScreenName, _
        '                                          tweet.Text))
        '    Next

        '    '*** To display current rate limit info. ***
        '    Dim resetWhen As New DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)
        '    resetWhen = resetWhen.AddSeconds(Service.RateLimitReset).ToLocalTime()
        '    Page.Response.Write(String.Format("Remaining = {0}; Limit = {1}; Next Reset = {2}", _
        '                                      Service.RateLimitRemaining, _
        '                                      Service.RateLimitCurrent, _
        '                                      resetWhen.ToString))

        'End Using

    End Sub

End Class
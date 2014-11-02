$(function () {
    GetTwitterData("from:psg_inside");
});


function GetTwitterData(string) {

    var OK = function (result) {
        for (var i = 0; i < result.length; i++) {
            alert(result[i].userName + result[i].tweetText);
        }
    }

    var KO = function (result) {
        alert(result);
    }

    var oAjax = new AjaxCall();
    oAjax.WebService = oAjax.URL_TWITTER;
    oAjax.WebMethod = "GetAllTweets";
    oAjax.AddParameter("tag", string);
    oAjax.Call(OK,KO);
}
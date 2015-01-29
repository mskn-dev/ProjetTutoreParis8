$(function () {
    $("#dataChangeRadios").find('input').each(function () {
        $(this).change(function () {
            getD3View(twitterObj, "login")
        });
    })
});

var twitterObj = new Object();

function GetTwitterData(string) {

    var OK = function (result) {
        if (result.length == 0)
            alert("aucun résultat obtenu pour ce Tag ! ");
        else{
            twitterObj = result;
            setTweetsOnPanel(result);
        }
    }

    var KO = function (result) {
        alert(result.Message);
    }

    var oAjax = new AjaxCall();
    oAjax.WebService = oAjax.URL_TWITTER;
    oAjax.WebMethod = "GetAllTweets";
    oAjax.AddParameter("tag", string);
    oAjax.Call(OK,KO);
}

function validerRecherche(div) {
    var $panel = $(div).parent().parent();
    var inputVal = $panel.find("#tweetsInput").val();
    var checkedRadio;
    var $tweetRadios = $panel.find("#tweetRadios").find(".radio").find('input');

    $tweetRadios.each(function () {
        if ($(this).is(':checked')) {
            checkedRadio = $(this).attr('id');
        } 
    });
    validerRechercheTag(inputVal, checkedRadio);
}

function validerRechercheTag(inputVal, checkedRadio) {
    var tag;
    if (checkedRadio == "Tweetradios-0")
        tag = "from:" + inputVal;
    else if (checkedRadio == "Tweetradios-1")
        tag = "to:" + inputVal;
    else if (checkedRadio == "Tweetradios-2")
        tag = "#" + inputVal;
    else if (checkedRadio == "Tweetradios-3")
        tag = "@" + inputVal;

    GetTwitterData(tag);

}

function setTweetsOnPanel(obj) {
    var tweets = obj;
    var $tweetPanel = $("#tweetsResultPanel").find(".tab-content").find("#vueBasique");
    $tweetPanel.html("");

    for (var i = 0; i < tweets.length;i++){
        var $tweetModele = $("#tweetsModele").clone();
        $tweetModele.attr('id', 'tweet_' + tweets[i].userName);
        $($tweetModele).find("#tweetHeader").find("#dateTweet").append("&nbsp;" + tweets[i].tweetDate.toLocaleDateString() + " " + tweets[i].tweetDate.toLocaleTimeString());
        $($tweetModele).find("#tweetHeader").find("#userTweet").append("&nbsp;"+tweets[i].userName + " : ");
        $($tweetModele).find("#tweetHeader").find("#userImg").find('img').attr('src', tweets[i].userImg);
        $($tweetModele).find("#tweetHeader").find("#followers").append("<span class='text-success'>&nbsp;( Suivi par " + tweets[i].userFollowers + " personnes )</span>");
        $($tweetModele).find("#tweetBody").append(tweets[i].tweetText);
        if (tweets[i].isRetweeted)
            $($tweetModele).find("#tweetButtons").append("<i class='fa fa-retweet text-success'></i> <span class='text-success'>Retweeté " + tweets[i].retweetCount + " fois");
        if (tweets[i].tweetLong > 0 || tweets[i].tweetLat >0)
            $($tweetModele).find("#tweetButtons").append("<span class='pull-right text-info' style='cursor:pointer;' onclick='tweetGeoloc(" + tweets[i].tweetLong + "," + tweets[i].tweetLat + ");'>Géolocaliser le tweet <i class='fa fa-globe'></i></span>");
        $($tweetModele).removeClass("displayNone");
        $($tweetPanel).append($tweetModele);
    }
    $("#tweetsResultPanel").fadeIn('slow');
}

function GetVueGraphique(param) {
    if (param == 'processing') {
        var canvas = document.getElementById("vueGraphiqueCanvas");
        // attaching the sketchProc function to the canvas
        var p = new Processing(canvas, sketchProc);
        // p.exit(); to detach it
    }
    else if (param == 'd3') {

        var twitterObj = new Object();
        twitterObj = getTwitterObj();

        getD3View(twitterObj,"tweet");
    }
    
}

function getTwitterObj() {
    return twitterObj;
}

function d3Object(tObject){
    this.name = tObject;
    this.word = tObject;
    this.count = tObject.length;
}

function getD3View(twitterObj, param) {
    if (param == "tweet") {
        var d3Array = new Array();

        for (var i = 0; i < twitterObj.length; i++) {
            textTab = twitterObj[i].tweetText.split(" ");
            for (var j = 0; j < textTab.length; j++) {
                var d3 = new d3Object(textTab[j]);
                d3Array.push(d3);
            }
        }
        getD3Viz(d3Array);
    }
    else if (param == "login") {
        var d3Array = new Array();

        for (var i = 0; i < twitterObj.length; i++) {
            var d3 = new d3Object(twitterObj[i].userName);
                d3Array.push(d3);
        }
        getD3Viz(d3Array);
    }
}
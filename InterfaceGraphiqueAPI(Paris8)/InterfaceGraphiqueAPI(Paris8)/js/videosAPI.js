var choixAPI = "YouTube";

$(function () {
    //Init DailyMotion API
    window.dmAsyncInit = function () {
        DM.init({ apiKey: 'a8fc7fc095ae152f89c8', status: true, cookie: true });
    };
    (function () {
        var e = document.createElement('script'); e.async = true;
        e.src = document.location.protocol + '//api.dmcdn.net/all.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(e, s);
    }());

});

function changeApi(div) {
    var id = $(div).attr('id');
    var topnav = $("#top-nav");

    $("#titleVideos").find('span').each(function () {
        $(this).removeClass('youtube');
        $(this).removeClass('dailymotion');
        $(this).removeClass('vimeo');
        $(this).addClass(id.split("-skin")[0]);
        if (id.split("-skin")[0] == "youtube"){
            $(this).html("Youtube");
            $("#titleRecherche").find('span').html("Youtube");
        }
        else if (id.split("-skin")[0] == "dailymotion"){
            $(this).html("DailyMotion");
            $("#titleRecherche").find('span').html("DailyMotion");
        }
        else if (id.split("-skin")[0] == "vimeo"){
            $(this).html("Vimeo");
            $("#titleRecherche").find('span').html("Vimeo");
        }
            
    });

    $("#titleRecherche").find('span').removeClass('youtube');
    $("#titleRecherche").find('span').removeClass('dailymotion');
    $("#titleRecherche").find('span').removeClass('vimeo');
    $("#titleRecherche").find('span').addClass(id.split("-skin")[0]);

    $("#youTubeResultPanel").removeClass('youtube');
    $("#youTubeResultPanel").removeClass('dailymotion');
    $("#youTubeResultPanel").removeClass('vimeo');
    $("#youTubeResultPanel").addClass(id.split("-skin")[0]);

    $("#youtube-skin").removeClass("active");
    $("#vimeo-skin").removeClass("active");
    $("#dailymotion-skin").removeClass("active");
    $(div).addClass('active');

    $("#theme-setting-icon").removeClass("vimeo");
    $("#theme-setting-icon").removeClass("youtube");
    $("#theme-setting-icon").removeClass("dailymotion");
    $("#theme-setting-icon").addClass(id.split("-skin")[0]);

    $("#vueGraphiqueV").removeClass("vimeo");
    $("#vueGraphiqueV").removeClass("youtube");
    $("#vueGraphiqueV").removeClass("dailymotion");
    $("#vueGraphiqueV").addClass(id.split("-skin")[0]);

    $("#theme-setting").find('.title').removeClass("vimeo");
    $("#theme-setting").find('.title').removeClass("youtube");
    $("#theme-setting").find('.title').removeClass("dailymotion");
    $("#theme-setting").find('.title').addClass(id.split("-skin")[0]);


    $(topnav).removeClass("vimeo");
    $(topnav).removeClass("dailymotion");
    $(topnav).removeClass("youtube");

    if (id == "youtube-skin") {
        $(topnav).addClass("youtube");
        choixAPI = "YouTube";
    }
    else if (id == "vimeo-skin") {
        $(topnav).addClass("vimeo");
        choixAPI = "Vimeo";
    }
    else if (id == "dailymotion-skin") {
        $(topnav).addClass("dailymotion");
        choixAPI = "DailyMotion";
    }
}
    //////////////////////////////////////////////////////////////////Classes//////////////////////////////////////////////////////////////////////////
function YouTube(video) {
    this.id = video.id.$t.split('/')[video.id.$t.split('/').length - 1];
    this.titre = video.title.$t;
    this.auteur = video.author[0].name.$t;
    this.datePublication = new Date(video.published.$t).toLocaleDateString();
    this.url = "www.youtube.com/embed/" + this.id;
}

function DailyMotion(video) {
    this.id = video.id;
    this.titre = video.title;
    this.auteur = video.owner;
    this.url = "//www.dailymotion.com/embed/video/" + this.id;
    this.thumbnail_url = video.thumbnail_url;
}

//////////////////////////////////////////////////////////// fonctions communes //////////////////////////////////////////////////////////////////
function getVideos() {

    if(choixAPI == "YouTube")
        getYoutubeVideos();
    else if (choixAPI == "DailyMotion")
        getDailyMotionVideos();
    else if (choixAPI == "Vimeo")
        getVimeoVideos();
}

function getDailyMotionVideos() {
    var videos = new Array();
    var tag = getTag();

    DM.api('/videos', { search: tag, fields:'title,id,owner,url,thumbnail_url' }, function (response) {
        for (var i = 0; i < response.list.length; i++) {
            var video = new DailyMotion(response.list[i]);
            videos.push(video);
        }
        setVideoOnPanel(videos);
        setDataOnVueGraphique(response, 'dailymotion');
    });
}


function getYoutubeVideos() {
    var videos = new Array();
    var tag = getTag();

    var jsonURL = 'https://gdata.youtube.com/feeds/api/videos?category=';
    var formatJSON = '&alt=json';


    var adresseComplete = jsonURL + tag + formatJSON;

    $.getJSON(adresseComplete, function (data) {
        $.each(data.feed.entry, function (i, video) {
            var video = new YouTube(video);
            videos.push(video);
        });
        setVideoOnPanel(videos);
        setDataOnVueGraphique(data,'youtube');
    });
}


//function getVimeoVideos() {
    
//    var videos = new Array();
//    var tag = getTag();

//    var jsonURL = "https://api.vimeo.com/?access_token=05cf265f1ca883636f9a4976c4bccdfc"//;'https://vimeo.com/api/rest/v2?method=vimeo.videos.search&query=';
//    //var formatJSON = '&access_token=05cf265f1ca883636f9a4976c4bccdfc&format=json';


//    var adresseComplete = jsonURL; //+ tag + formatJSON;

//    $.getJSON(adresseComplete, function (data) {
//        onData(data);
//        $.each(data.feed.entry, function (i, video) {
//            var video = new YouTube(video);
//            videos.push(video);
//        });
//        setVideoOnPanel(videos);
//    });
//}

function setVideoOnPanel(videos) {
    var youtubeModel;
    var panelResult = $("#videoContainer");
    $(panelResult).html('');
    for (var i = 0; i < videos.length; i++) {
        youtubeModel = $("#videosModele").clone();
        $(youtubeModel).find("#titreY").html("Titre : "+videos[i].titre);
        $(youtubeModel).find("#descriptionY").html("Auteur : " + videos[i].auteur + "<br/>" + "Date de publication : " + videos[i].datePublication);
        $(youtubeModel).find("#urlY").attr('src',"//"+videos[i].url);
        $(panelResult).append($(youtubeModel).html());
    }
    $("#youTubeResultPanel").fadeIn('slow');
}

function getTag() {
    return $("#videosInput").val();
}

function Caroussel(action) {
    var caroussel = $("#videoContainer");
    var carousselWidth = $('.movie-jcarousel').innerWidth();
    var maxWidth = $(caroussel).innerWidth();
    var attr =0;
    var tr = 0;

    if ($("#videoContainer").attr('style') == undefined || $("#videoContainer").attr('style').split('left')[1] == "")
        attr = 0;
    else
        attr = parseInt($("#videoContainer").attr('style').split('left')[1].replace('px;', '').replace(':', ''));

    if (action == "previous") {
        tr = attr + carousselWidth;
        if (tr < carousselWidth)
            $("#videoContainer").css('left',tr + 'px');
    }
    else if (action == "next") {
        tr = attr - carousselWidth;
        if (tr < maxWidth)
            $("#videoContainer").css('left', tr + 'px');
    }

}

function GetVueGraphique() {
    var query = $("#videosInput").val();
    //search(query);
    $("#vueGraphiqueV").children().css('height', 'inherit');
    $("#vueGraphiqueV").children().css('width', 'inherit');
    $("#vueGraphiqueV").children().css('position', 'relative');
}
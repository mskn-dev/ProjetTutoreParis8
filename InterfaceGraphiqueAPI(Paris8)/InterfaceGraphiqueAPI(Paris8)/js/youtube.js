$(function () {

});

function YouTube(video) {
    this.id = video.id.$t.split('/')[video.id.$t.split('/').length - 1];
    this.titre = video.title.$t;
    this.auteur = video.author[0].name.$t;
    this.datePublication = new Date(video.published.$t).toLocaleDateString();
    this.url = "www.youtube.com/embed/" + this.id;
}

function getVideos() {
    var videos = new Array();
    var tag = getTag();

    var jsonURL = 'https://gdata.youtube.com/feeds/api/videos?category=';
    var formatJSON = '&alt=json';
	
	
    var adresseComplete = jsonURL + tag + formatJSON;
	
    $.getJSON(adresseComplete, function(data){
	
        $.each(data.feed.entry, function(i, video){
            var video = new YouTube(video);
            videos.push(video);
        });
        setVideoOnPanel(videos);
    });
}

function setVideoOnPanel(videos) {
    var youtubeModel;
    var panelResult = $("#videoContainer");
    $(panelResult).html('');
    for (var i = 0; i < videos.length; i++) {
        youtubeModel = $("#youTubeModele").clone();
        $(youtubeModel).find("#titreY").html("Titre : "+videos[i].titre);
        $(youtubeModel).find("#descriptionY").html("Auteur : " + videos[i].auteur + "<br/>" + "Date de publication : " + videos[i].datePublication);
        $(youtubeModel).find("#urlY").attr('src',"//"+videos[i].url);
        $(panelResult).append($(youtubeModel).html());
    }
    $("#youTubeResultPanel").fadeIn('slow');
}

function getTag() {
    return $("#youTubeInput").val();
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
    var query = $("#youTubeInput").val();
    search(query);
    $("#vueGraphiqueY").children().css('height', 'inherit');
    $("#vueGraphiqueY").children().css('width', 'inherit');
    $("#vueGraphiqueY").children().css('position', 'relative');
}
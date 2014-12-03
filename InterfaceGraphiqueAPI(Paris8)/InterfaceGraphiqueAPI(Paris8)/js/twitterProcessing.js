var tweet = new Object();


function sketchProc(processing) {
    var largeur = 900;
    var hauteur = 900;
    var img;
    //var centerX = largeur / 2, centerY = hauteur / 2;

    var twitterObj = new Object();
    twitterObj = getTwitterObj();

    processing.setup = function () {
        processing.frameRate(2);
        processing.size(hauteur, largeur, processing.P2D);
        processing.smooth();
        processing.noStroke();
        processing.textFont(processing.createFont("Serif", 30));
        processing.textAlign(processing.CENTER);
        img = processing.loadImage("img/twitter_bg.jpg");
       
    }
    // Par default la fonction draw est appelée 60 fois par seconde
    processing.draw = function () {

        // erase background
        processing.background(img);
        //processing.background(255);
        
        for (var i = 0; i < twitterObj.length; i++) {
            var x = Math.random() * largeur;
            var y = Math.random() * hauteur;

            tweet = twitterObj[i];
            processing.textSize(processing.random(50), processing.random(100), processing.P2D);
            processing.text(tweet.userName, x, y);
            processing.fill(processing.random(255), processing.random(255), processing.random(255), processing.random(255));
            
        }
          
           
    };

}





var tweet = new Object();


function sketchProc(processing) {
    var largeur = 900;
    var hauteur = 500;
    //var img;
    var delay = 1;
    //var centerX = largeur / 2, centerY = hauteur / 2;

    var twitterObj = new Object();
    twitterObj = getTwitterObj();

    processing.setup = function () {
        processing.frameRate(2);
        processing.size(largeur,hauteur,processing.P2D);
        processing.smooth();
        processing.noStroke();
        processing.textFont(processing.createFont("Serif", 30));
        processing.textAlign(processing.CENTER);
        //img = processing.loadImage("img/twitter_bg.jpg");

        X = processing.width / 2;
        Y = processing.height / 2;
        nX = X;
        nY = Y;
       
    }
    // Par default la fonction draw est appelée 60 fois par seconde
    processing.draw = function () {

        X += (nX - X) / delay;
        Y += (nY - Y) / delay;

        // erase background
        //processing.background(img);
        processing.background(255);
        
        for (var i = 0; i < twitterObj.length; i++) {
            var x = Math.random() * largeur;
            var y = Math.random() * hauteur;

            tweet = twitterObj[i];
            processing.textMode(processing.SCREEN);
            processing.textSize(processing.random(50), processing.random(100), processing.P2D);
            processing.text(tweet.tweetText, x, y);
            processing.fill(processing.random(255), processing.random(255), processing.random(255), processing.random(255));
            
        }
          
           
    };

    //processing.mouseMoved =function () {
    //    nX = processing.mouseX;
    //    nY = processing.mouseY;
    //};
        
}





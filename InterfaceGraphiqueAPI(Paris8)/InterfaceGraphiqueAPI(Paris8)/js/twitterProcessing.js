var tweet = new Object();

function sketchProc(processing) {
    var largeur = processing.width;
    var hauteur = processing.height;

    //var centerX = largeur / 2, centerY = hauteur / 2;

    var twitterObj = new Object();
    twitterObj = getTwitterObj();

    processing.setup = function () {
        processing.noStroke();
        processing.frameRate(2);
        processing.size(hauteur, largeur, processing.P2D);
        //processing.strokeWeight(10);
        processing.textFont(processing.createFont("Serif", 30));
        processing.textAlign(processing.CENTER);
        //processing.filter(processing.OPAQUE);
        //processing.strokeWidth(175);
    }
    // Par default la fonction draw est appelée 60 fois par seconde
    processing.draw = function () {

        // erase background
        processing.background(255);
        


        for (var i = 0; i < twitterObj.length; i++) {
            var x = Math.random() * largeur;
            var y = Math.random() * hauteur;

            tweet = twitterObj[i];
            processing.textSize(Math.random() * 10, 50, processing.P2D);
            processing.text(tweet.userName, x, y);
            processing.fill(0, Math.floor(Math.random() * 255),Math.floor(Math.random() * 255), Math.floor(Math.random() * 255));
            
        }
          
           
    };

}





class Ball {

  float xPos = random (width);
  float yPos = random (-60000, 0);

  float r = random(0, 255);
  float b = random(0, 255);
  float g = random(0, 255);

  Boolean display = true;


  void fall() {

    yPos = yPos + vy;
  }

  void show() {
    if (display) {
      fill(r, g, b);
      ellipse(xPos, yPos, radius, radius);
    }
  }


  Boolean insideBall() {

    float d = dist( xPos, yPos, mouseX, mouseY); 

    if (d < radius/2) {

      return true;
    } else {

      return false;
    }
  }

  void PopBall() {

    display = false;
  }

  void addPoints() {

    text(points, 0, 0);
    points = points + 1;
  }

  boolean GameOver() {

    if (yPos > height && display == true) {

      // background.stop();
      background.stop();
      end.play();


      return false;
    }
    return true;
  }
  
  void rePlaySong(){
 inplay = true;
  background.play();
  }

  void Restart() {
    setMyTime(0);
    yPos = random (-60000, 0);
    points = 0;
    radius = 50;
    vy = 0.55;

    inplay = true;
  }
}
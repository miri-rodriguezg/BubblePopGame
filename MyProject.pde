import processing.sound.*;
SoundFile background, pop, end;

float vy ;
float radius;
int points;
boolean inplay;

String lost = "GAME OVER";
String Score = "Your score was:";
String Restart = "Play Again";


float x = 300;
float y = 450;

int myTime; 

ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {

  size(600, 600);
  background = new SoundFile(this, "Background2.mp3");
  pop = new SoundFile(this, "Bubble2.mp3");
  end = new SoundFile(this, "Fail.mp3");
  inplay = true;

  if (inplay) {
    background.play();
  }


  for (int i=0; i<1000; i++) {
    balls.add(new Ball());
  }
}

void draw() {

  background(249, 250, 201);
  if ( inplay == true) {

    textSize(40);
    fill(0);
    text(str(points), 30, 50);

    for (int i=0; i<balls.size() && inplay; i++) {


      balls.get(i).show();
      balls.get(i).fall();
      inplay = balls.get(i).GameOver();
    }
  }

  if (!inplay) {
    background(237, 91, 245);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(60);
    text(lost, 300, 200);
    textSize(30);
    text(Score, 300, 300);
    textSize(50);
    text(points, 300, 375);

    fill(222, 20, 209);
    rect(x, y, 200, 50);
    fill(0);
    rectMode(CENTER);
    textSize(30);
    text(Restart, 300, 445);
  } 

  if (myTime/60 <=20) {
    vy=0.55;
  }
  if (myTime/60 >=20) {
    vy = vy + 0.0005;  //make balls move faster every 20 seconds.
  }

  if (myTime/60 <=25) {
    radius = 50;
  }
  if (myTime/60 >=25 ) {
    radius = radius -0.01; //make balls become smaller every 25 seconds.

    radius = constrain(radius, 10, 50);
  }
  myTime ++;
}

void mousePressed() {

  for (int i=0; i<balls.size(); i++) {

    if ( balls.get(i).insideBall()) {

      balls.get(i).PopBall();
      balls.get(i).addPoints();
      pop.play();
    }

    if (mouseX < x + 100 && mouseX > x - 100 && mouseY < y + 25 && mouseY > y - 25) {

      balls.get(i).Restart();
    }
  }
}

void setMyTime(int newTime) {
  myTime = newTime;
}
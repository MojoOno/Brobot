import java.util.ArrayList;

class Brobot {
  
  ArrayList<Float> teethXPosition;
  ArrayList<Float> teethYPosition;
  
  float leftEyeRed;
  float leftEyeGreen;
  float leftEyeBlue;

  float rightEyeRed;
  float rightEyeGreen;
  float rightEyeBlue;

  float mouthRed;
  float mouthGreen;
  float mouthBlue;

  float headX;
  float headY;

  float mouthX;
  float mouthY;

  float neckX;
  float neckY;
  float neckW;

  float torsoX;
  float torsoY;
  float torsoW;
  float torsoH;
  float torsoMaxBredde;
  float torsoMinBredde;

  float rightLegX;
  float rightLegY;
  float leftLegX;
  float leftLegY;
  float legW;
  float legH;
  float legChange=0;

  float hjulbenX;
  float hjulbenY;
  float hjulbenW;

  int heartbeat;
  float direction;
  float change = 0.5;

  //Constructor
  Brobot(float tempX) {
    //Diverse variabler
    torsoX = tempX;
    torsoY = 310;
    torsoW = 200;
    torsoH = 125;
    rightLegX = torsoX-torsoW/8;
    rightLegY = 396;
    leftLegX = torsoX+torsoW/8;
    leftLegY = 396;
    legW = 10;
    legH = 48;
  }

  //Tegner Brobot
  void drawBrobot() {
    rectMode(CENTER);
    ellipseMode(CENTER);
    headX = torsoX;
    headY = torsoY - 135; //175 for referance

    drawAntenna();
    drawHead();
    drawEyes();
    drawMouth();
    drawTeeth();
    drawNeck();
    drawArms();
    drawWheel();
    drawLegs();
    drawTorso();
  }
  
  void drawAntenna() {
    //Brobots antenne
    strokeWeight(4);
    line(headX, headY-50, headX, headY-75);

    //Kuglen på antennen
    strokeWeight(1);
    ellipse(headX, headY-75, 15, 15);
  }

  void drawHead() {
    //Brobots hovede
    strokeWeight(1);
    fill(155);
    rect(headX, headY, 150, 100);
  }

  void drawEyes() {
    //Brobots øjne
    strokeWeight(1);
    leftEyeRed = random(255);
    leftEyeGreen = random(255);
    leftEyeBlue = random(255);
    fill(leftEyeRed, leftEyeGreen, leftEyeBlue);
    ellipse(headX-35, headY-10, 25, 35);

    rightEyeRed = random(255);
    rightEyeGreen = random(255);
    rightEyeBlue = random(255);
    fill(rightEyeRed, rightEyeGreen, rightEyeBlue);
    ellipse(headX+35, headY-10, 25, 35);

    //Brobots pupiller
    strokeWeight(8);
    point(headX-35, headY-10);
    point(headX+35, headY-10);
  }

  void drawMouth() {
    //Brobots mund
    strokeWeight(1);
    mouthRed = random(255);
    mouthGreen = random(255);
    mouthBlue = random(255);
    fill(mouthRed, mouthGreen, mouthBlue);
    rect(headX, headY+28, 70, 30);
  }

  void drawTeeth() {
    //Brobots tænder (horisontal)
    line(headX-35, headY+23, headX+35, headY+23);
    line(headX-35, headY+32, headX+35, headY+32);
    //Lav tænderne med array og et loop, så de kan skifte farve for hver tand.
    //Brobots tænder (vertical) 14
    line(headX-21, headY+13, headX-21, headY+43);
    line(headX-7, headY+13, headX-7, headY+43);
    line(headX+7, headY+13, headX+7, headY+43);
    line(headX+21, headY+13, headX+21, headY+43);
  }

  void drawNeck() {
    //Brobots hals
    fill(155);
    neckX = torsoX;
    neckY = torsoY-72;
    neckW = torsoW/7;
    rect(neckX, neckY, neckW, 25);
  }

  void drawArms() {
    //Brobots venstre arm
    strokeWeight(12);
    line(torsoX+torsoW/2, 290, torsoW/6+torsoX+torsoW/2, 320);

    //Brobots højre arm
    line(torsoX-torsoW/2, 290, -torsoW/6+torsoX-torsoW/2, 320);
  }

  void drawWheel() {
    //Brobots hjulben (Dette er selve hjulet)
    noStroke();
    hjulbenX = torsoX;
    hjulbenY = 415;
    hjulbenW = 30;
    ellipse(hjulbenX, hjulbenY, 30+(40-torsoW/5), 70);

    //Linjerne i hjulet
    stroke(0);
    strokeWeight(1);
    //line(hjulbenX-hjulbenW/3, 388, hjulbenX-hjulbenW/3, 440);
    //line(hjulbenX, 380, hjulbenX, 450);
    //line(hjulbenX+hjulbenW/3, 388, hjulbenX+hjulbenW/3, 440);
    noFill();
    direction = cos((2*PI*(frameCount)/400));
    println(direction);

    ellipse(hjulbenX-hjulbenW/3-10*direction, 415, 1+52*(200-torsoW)/200, 52);       //Højre
    ellipse(hjulbenX+hjulbenW/3+10*direction, 415, 1+52*(200-torsoW)/200, 52);
    //ellipse(hjulbenX-hjulbenW/3+(15-torsoW*hjulbenW/600) ,415, 1, 52);
    ellipse(hjulbenX, 415, 1, 70);                  //Midter "Linjen"
    //ellipse(hjulbenX+hjulbenW/3-(200*hjulbenW/600-torsoW*hjulbenW/600) ,415, 1+52*(200-torsoW)/200, 52);     //Venstre
  }

  void drawLegs() {
    //Brobots ben
    stroke(0);
    fill(0);
    strokeWeight(1);

    //Højre Ben
    if (torsoW<10 && torsoW>0) {
      legChange +=change;
    }
    rightLegX = torsoX-torsoW/8;
    //rect(rightLegX, rightLegY, legW, legH);
    rect(rightLegX, rightLegY, legW+legChange, legH);
    //println(legChange + " - " + change);

    //Venstre ben
    leftLegX = torsoX+torsoW/8;
    rect(leftLegX, leftLegY, legW+legChange, legH);

    //Hænglserne
    strokeWeight(4);
    //Right dot
    point(rightLegX+(legW+legChange)/2, 418);
    //Left dot
    point(leftLegX-(legW+legChange)/2, 418);
  }

  void drawTorso() {
    //Brobots torso ---- Er hernede da den skygger over hemmelighederne bag torso.
    strokeWeight(1);
    fill(155);
    rect(torsoX, torsoY, torsoW, torsoH);
    torsoW = torsoW+change;           // Opdaterer bredden

    //Hvis rect når højre bredde på torsos størrelse, skift da retning til venstre
    if (torsoW >= 200) {
      change = -1;
    }

    //Hvis rect når venstre bredde på torsos størrelse, skift retning til højre
    if (torsoW <= 0) {
      change = 1;
    }
  }
}

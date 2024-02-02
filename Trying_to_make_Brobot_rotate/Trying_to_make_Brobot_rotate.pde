//Exercise 4-6 and 4-7

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

void setup() {
  size(500, 500);
//Diverse variabler
  torsoX = width/2;
  torsoY = 310;
  torsoW = 200;
  torsoH = 125;
  rightLegX = torsoX-torsoW/8;
  rightLegY = 396;  
  leftLegX = torsoX+torsoW/8;
  leftLegY = 396;
  legW = 10;
  legH = 48;
  smooth();
  println("I am Brobot and I suply wireless water");
}

void draw() {
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(145,5,29);
  heartbeat = (200 - frameCount%400);

  //Brobots antenne
  strokeWeight(4);
  line(250, 125, 250, 100);

  //Kuglen på antennen
  strokeWeight(1);
  ellipse(250, 100, 15, 15);

  //Brobots hovede
  strokeWeight(1);
  fill(155);
  headX = width/2;
  headY = 175;
  rect(headX, headY , 150, 100);

  //Brobots øjne
  strokeWeight(1);
  leftEyeRed = random(255);
  leftEyeGreen = random(255);
  leftEyeBlue = random(255);
  fill(leftEyeRed, leftEyeGreen, leftEyeBlue);
  ellipse(215, 165, 25, 35);
  rightEyeRed = random(255);
  rightEyeGreen = random(255);
  rightEyeBlue = random(255);
  fill(rightEyeRed, rightEyeGreen, rightEyeBlue);
  ellipse(285, 165, 25, 35);

  //Brobots pupiller
  strokeWeight(8);
  point(215, 165);
  point(285, 165);

  //Brobots mund
  strokeWeight(1);
  mouthRed = random(255);
  mouthGreen = random(255);
  mouthBlue = random(255);
  fill(mouthRed, mouthGreen, mouthBlue);
  mouthX = width/2;
  mouthY = 203;
  rect(mouthX, mouthY, 70, 30);

  //Brobots tænder (horisontal)
  line(215, 198, 285, 198);
  line(215, 208, 285, 208);

  //Brobots tænder (vertical) 14
  line(229, 188, 229, 218);
  line(243, 188, 243, 218);
  line(257, 188, 257, 218);
  line(271, 188, 271, 218);

  //Brobots hals
  fill(155);
  neckX = width/2;
  neckY = 238;
  neckW = torsoW/7;
  rect(neckX, neckY, neckW, 25);

  //Brobots venstre arm
  strokeWeight(12);
  line(torsoX+torsoW/2, 290, torsoW/6+torsoX+torsoW/2, 320);

  //Brobots højre arm
  line(torsoX-torsoW/2, 290, -torsoW/6+torsoX-torsoW/2, 320);

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
  ellipse(hjulbenX-hjulbenW/3+(15*heartbeat/200) ,415, 1+52*(200-torsoW)/200, 52);       //Højre
  //ellipse(hjulbenX-hjulbenW/3+(15-torsoW*hjulbenW/600) ,415, 1, 52);
  ellipse(hjulbenX,415, 1, 70);                  //Midter "Linjen"
  //ellipse(hjulbenX+hjulbenW/3-(200*hjulbenW/600-torsoW*hjulbenW/600) ,415, 1+52*(200-torsoW)/200, 52);     //Venstre

  //Brobots ben
  stroke(0);
  fill(0);
  strokeWeight(1);
  
  //Højre Ben
  if (torsoW<10 && torsoW>0){
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



  //Brobots torso
  strokeWeight(1);
  fill(155);
  rect(torsoX, torsoY, torsoW, torsoH);
  torsoW = abs(heartbeat);           // Opdaterer bredden
  
   //Hvis rect når højre bredde på torsos størrelse, skift da retning til venstre
   if (torsoW >= 200) {
     change = -1;
   }
   
   //Hvis rect når venstre bredde på torsos størrelse, skift retning til højre
   if (torsoW <= 0) {
     change = 1;
   }
  
 
  
  //Fun and games
  //rectMode(CENTER);
  //rect(mouseX,mouseY,30,30);
  
  
}

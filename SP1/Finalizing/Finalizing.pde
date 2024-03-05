//SP-1
Brobot brobot;
Brobot brobot1;

void setup() {
  size(500, 500);
  smooth();
  brobot = new Brobot(width/2);
  //brobot1 = new Brobot(100);
}

void draw() {

  background(145, 5, 29);
  //heartbeat = (200 - frameCount%400);
  brobot.drawBrobot();
  //brobot1.drawBrobot();
}

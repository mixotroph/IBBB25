Player p;
Keyhandler kh;

void setup() {
  size(800, 600);
  noStroke();
  kh = new Keyhandler();
  p =  new Player(kh);
}

void draw() {
  background(120, 200, 255);
  p.update();
  p.draw();
}

void keyPressed() {
  if (key=='w') kh.w=true;
}

void keyReleased() {
  if (key=='w') kh.w=false;
}

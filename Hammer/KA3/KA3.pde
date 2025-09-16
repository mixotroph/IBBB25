PImage magnet;
Gegenstand g1;

void setup() {
  size(800,600);
  magnet = loadImage("magnet.png");
  g1 = new Gegenstand("hammer.png","Hammer",true);
}

void draw() {
  background(150,200,255);
  image(magnet,0,200,200,191);
  
  g1.update();
  g1.draw();
}

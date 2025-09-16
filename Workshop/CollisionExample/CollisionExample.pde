int x, y, delta;
PImage img;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  rectMode(CENTER);
  img = loadImage("asteroid.png");
  x = width/2;
  y = height/2;
  delta = 50;
  
}

void draw() {
  background(100, 100, 100);
  
  if (abs(x- mouseX) < delta && abs(y - mouseY) < delta) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }

  noStroke();
  image(img,x, y, 50, 50);
  rect(mouseX, mouseY,50,50);
  if (y<height) {y++;}
  else {y=-50;}
}

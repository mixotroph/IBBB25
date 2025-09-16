PImage tree;
PImage ufo;
PImage eule;
int n = 300;
int[] rainX = new int[n];
int[] rainY = new int[n];

int ufoY = 210;
int ufoX = 0;

int euleX = 200;
int richtung = 1;

void setup() {
  size(800, 600);
  size(800, 600);
  for (int i = 0; i < n; i++) {
    rainX[i] = int(random(0, 800));
    rainY[i] = int(random(-400, 0));
  }

  tree = loadImage("tree.png");
  eule = loadImage("eule.png");
  ufo = loadImage("ufo_1.png");
}


void draw() {
  background(#515076);
  starteRegen();
  noStroke();
  fill(255, 255, 0, 100);


  if (ufoX > 0 && ufoX < 220) {
    triangle(ufoX+100, ufoY+90, ufoX+50, ufoY+400, ufoX+150, ufoY+400);
  }

  image(ufo, ufoX, ufoY, 200, 100);

  if (ufoX < 220) {
    ufoX +=1;
  }

  if (ufoX >= 220) {
    ufoX +=1;
    ufoY -=2;
  }

  euleX +=richtung;

  if (euleX>250) {
    richtung *=-1;
  }

  if (euleX<140) {
    richtung *=-1;
  }

  if (ufoY < -200) {
    ufoX =-200;
    ufoY=210;
  }

  fill(#507656);
  rect(0, 550, 800, 50);
  image(eule, 600, euleX, 80, 80);
  image(tree, 400, 180, 360, 400);
}
// ------------------------------------------------------------------------------
// Hier endet die draw-Methode. 
// Unterhalb dieser Zeile dürfen keine Anpassungen/Ergänzungen vorgenommen werden!
// ------------------------------------------------------------------------------

void starteRegen() {
  // Anfang Regenanimation
  strokeWeight(2);
  stroke(200, 200, 255);
  for (int i = 0; i < n; i++) {
    line(rainX[i], rainY[i], rainX[i], rainY[i]+20);
    rainY[i]+=int(random(8, 15));
    if (rainY[i] > 550) {
      rainY[i] = int(random(-400, 0));
    }
  }

  if (frameCount % 100 == 0 || frameCount % 110 == 0) {
    fill(255, 255, 255);
    rect(0, 0, 800, 600);
  }
  stroke(0, 0, 0);
  strokeWeight(1);
  // Ende Regenanimation
}

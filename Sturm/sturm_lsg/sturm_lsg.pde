/* 
 * 
 *
 *
 */
PImage shark;
PImage felsen;
int n = 300;
int[] rainX = new int[n];
int[] rainY = new int[n];

int bootY = 410;
int bootX = 0;

int sharkY = 500;
int richtung = 1;

void setup() {
  size(800, 600);
  for (int i = 0; i < n; i++) {
    rainX[i] = int(random(0, 800));
    rainY[i] = int(random(-400, 0));
  }

  shark = loadImage("shark.png");
  felsen = loadImage("felsen.png");
}


void draw() {
  background(100, 100, 190);


  image(felsen, 500, 380, 160, 110);
  strokeWeight(0);

  fill(200, 50, 55);
  quad(bootX, bootY, bootX+200, bootY, bootX+150, bootY+50, bootX+50, bootY+50);

  if (bootX < 350) {
    bootX +=1;
  }

  regen();

  if (bootX==350) {
    bootY +=1;
  }

  if (bootY > 600) {
    bootX =-200;
    bootY=410;
  }





  image(shark, 200, sharkY, 160, 110);
  sharkY +=richtung;

  if (sharkY>600) {
    richtung *=-1;
  }

  if (sharkY<380) {
    richtung *=-1;
  }

  fill(0, 0, 200);
  rect(0, 450, 800, 150);
}

void regen() {
  // Anfang Regenanimation
  strokeWeight(2);
  stroke(200, 200, 255);
  for (int i = 0; i < n; i++) {
    line(rainX[i], rainY[i], rainX[i], rainY[i]+20);
    rainY[i]+=int(random(8, 15));
    if (rainY[i] > 450) {
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


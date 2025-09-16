PImage cloud; 
PImage sun;
PImage groehre;
PImage rroehre;
PImage car;
PImage mario;
PImage gPanzer;
PImage gPanzer2;
PImage goomba;
PImage Gameover;

int poscloud = 50;
int posgroehre = 420;
int posrroehre = 500;
float poscar = 420;
int pospanzer = 550;
int posgoomba = 1000;



boolean forward = false;
boolean panzer = true;
boolean up = false;
boolean down = false;
boolean GameOver = false;

void setup() {
  size(800, 600);
  noStroke();
  sun = loadImage("sun sunshine.png");
  sun.resize(140, 140);
  car = loadImage("car.png");
  car.resize(290, 120);
  cloud = loadImage("cloud.png"); 
  cloud.resize(120, 80);
  groehre = loadImage("gröhre.png");
  groehre.resize(50, 120);
  rroehre = loadImage("rröhre.png");
  rroehre.resize(120, 200);
  mario = loadImage("mario.png");
  mario.resize(100, 140);
  gPanzer = loadImage("Grüner panzer.png");
  gPanzer.resize(45, 40);
  gPanzer2 = loadImage("Grüner panzer.png");
  gPanzer2.resize(45, 40);
  goomba = loadImage("Goomba.png");
  goomba.resize(100, 120);
  Gameover = loadImage("Game over.jpg");
  Gameover.resize(800,600);
}

void draw() {
  background(100, 150, 255);
  fill(250, 80, 50);
  rect(0, 420, 800, 180);


  image(sun, 400, 50);
  image(cloud, poscloud, 50);
  image(groehre, posgroehre, 301);
  image(mario, 380, poscar-37);
  image(car, 280, poscar);
    image(goomba, posgoomba, 420);
  image(rroehre, posrroehre, 400);
  


  if (forward == true) {
    poscloud = poscloud -8;
    posgroehre = posgroehre -11;
    posrroehre = posrroehre -14;
    poscar = random(418, 421);
    posgoomba = posgoomba -9;
  }

  if (poscloud <= -300) {
    poscloud = 900;
  }
  if (posgroehre <= -300) {
    posgroehre = 900;
  }
  if (posrroehre <= -300) {
    posrroehre = 900;
  }
  if (posgoomba <= -300) {
    posgoomba = 1200;
  }
  if (panzer == true) {
    image(gPanzer, 420, poscar-60);
  } 



  if (panzer == false) {
    image(gPanzer2, pospanzer, 500);
    pospanzer = pospanzer +10;
  }
  if (dist (pospanzer , posgoomba)<=6)  {
    posgoomba = int( random(1000, 2000));
  }
  if (dist (int(poscar) , posgoomba)<=3){
     GameOver = true;
  }
  if (GameOver == true) {
  image(Gameover,1,1);
  }
}

int dist(int x1,int x2){
return abs(x1-x2);
}

void keyPressed() {
  if (key == ' ') {
    panzer = true;
  }

  if (key == 'd') {
    forward = true;
  }
}


void keyReleased() {
  if (key == ' ') {
    panzer = false;
    pospanzer = 550;
  } 

  if (key == 'd') {
    forward = false;
  }
}


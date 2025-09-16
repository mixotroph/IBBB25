PImage cloud, sun, car, cactus, cactus1;
int cloudX = 800;
int carY = 495;
int cactusX = 50;
int cactus1X = 800;
boolean forward = false;

void setup() {
  size(800, 600);
  cloud = loadImage("cloud.png");
  sun = loadImage("sun.png");
  car = loadImage("car.png");
  cactus = loadImage("cactus.png");
  cactus1 = loadImage("cactus.png");
  cloud.resize(100, 50);

  sun.resize(100, 100);
  car.resize(250, 75);
  cactus.resize(50, 150);
  cactus1.resize(50, 150);
}

void draw() {
  noStroke();
  background(150, 220, 255);
  fill(200, 200, 0);
  rect(0, 500, width, 100);
  image(sun, 400, 50);
  image(cloud, cloudX, 50);
  image(cactus, cactusX, 350);
  image(cactus1, cactus1X, 350);
  image(car, 250, carY);

  if (forward == true) {
    // action wenn man nach vorne fährt
    carY = int(random(495, 500));
    cloudX-=1;
    cactusX-=5;
    if (cloudX < -150) {
      cloudX = 800;
    }
    if (cactusX < -150) {
      cactusX = 800;
    }
  }
}

void keyPressed() {
  if (key == 'd') forward = true;
}

void keyReleased() {
  if (key == 'd') forward = false;
}

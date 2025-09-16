Player p;
ArrayList<Asteroid> asteroids;
ArrayList<PowerUp> powerUps;

KeyHandler kh;
Counter ca, cp;
int asteroidSpawnTime;

void setup() {
  size(640, 480);
  imageMode(CENTER);
  kh = new KeyHandler();
  p = new Player(kh);
  asteroids = new ArrayList<Asteroid>();
  powerUps = new ArrayList<PowerUp>();
  asteroids.add(new Asteroid());
  ca = new Counter();
  cp = new Counter();
  ca.start();
  cp.start();
  asteroidSpawnTime = 1000;
}

void draw() {
  background(100, 100, 255);

  // add one more asteroid every x seconds
  if (ca.getDuration() > asteroidSpawnTime) {
    asteroids.add(new Asteroid());
    ca.reset();
  }

  // add one more powerup every x seconds
  if (cp.getDuration() > 5000) {
    powerUps.add(new PowerUp());
    cp.reset();
  }

  p.update();
  // if the player was hit, let him blink
  if (p.hit) {
    p.blink();
  }
  p.draw();
  p.drawBlasts();

  // draw Asteroids
  for (int i = 0; i< asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    a.update();
    a.draw();
  }

  for (int i = 0; i< powerUps.size(); i++) {
    PowerUp pu = powerUps.get(i);
    pu.update();
    pu.draw();
  }

  // UI
  fill(0);
  textSize(24);
  text("Energie: " +p.energy, 510, 25);
  text("Ammo: " +p.ammo, 10, 25);
  textSize(10);
  text("Object count: ", 10, 470);
  text("Astroiden: " +asteroids.size(), 80, 470);
  text("Blasts: " +p.blasts.size(), 150, 470);


}

void keyPressed() {
  if (key == 'a') {
    kh.a = true;
  }
  if (key == 'd') {
    kh.d = true;
  }
  if (key == 'w') {
    kh.w = true;
  }
  if (key == 's') {
    kh.s = true;
  }
  if (key == ' ') {
    kh.space = true;
    p.bc.start();
  }
}

void keyReleased() {
  if (key == 'a') {
    kh.a = false;
  }
  if (key == 'd') {
    kh.d = false;
  }
  if (key == 'w') {
    kh.w = false;
  }
  if (key == 's') {
    kh.s = false;
  }

  if (key == ' ') {
    kh.space = false;
    p.bc.stop();
  }
}

public void gameOver() {
  noLoop();
  p.visible = true;
  p.draw();
  fill(255,0,0);
  textSize(36);
  text("GAME OVER", width/2-50, height/2);
}

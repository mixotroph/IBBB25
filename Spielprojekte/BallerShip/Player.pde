class Player {

  int x, y, duration, size, power, speed, maxSpeed, points;
  float acceleration;
  boolean shield;
  PImage img;
  Gun gun;

  public Player(int x, int y) {
    this.x=x;
    this.y=y;
    duration = 20;
    size = 30;
    power = 20;
    maxSpeed = 10;
    speed = 5;
    acceleration = 1;
    points = 0;
    img = loadImage("rocket.png");
    // Kanone erzeugen
    gun = new Gun();
  }


  void update() {

    // Wird gerade geschossen?
    if (fire==true) {
      gun.fire();
    }

    // Bewegungen abfragen
    if (up && y>10) {
      y -= speed;
    }
    if (down && y<height-10) {
      y += speed;
    }
    if (left && x >0+10) {
      x -= speed;
    }
    if (right && x<width-10) {
      x += speed;
    }
  }

  void increasePoints(int points) {
    this.points += points;
  }


  void hit() {
    power--;
    if (power>5) {
      shield = true;
    } else {
      size = 10;
    }
  }

  void draw() {
    noStroke();
    fill(255, 0, 0);
    image(img, x, y, 40, 75);
    if (shield && duration >=0) {
      stroke(0, 255, 0, 100);
      strokeWeight(100);
      point(x, y);

      duration--;
    } else {
      duration=20;
      shield=false;
    }
  }
}

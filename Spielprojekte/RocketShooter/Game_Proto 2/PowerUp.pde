class PowerUp extends Entity {

  int ammo;

  public PowerUp() {
    visible = true;
    speed=1;
    ammo = (int) random(0, 50);
    x = (int) random(0, width);
    y = (int) random(-600, -50);
  }

  public void update() {
    // if powerup leaves visible area it vanishes
    if (y<height) {
      y+=speed;
    } else {
      powerUps.remove(this);
    }
  }

  public void draw() {
    if (visible) {
      fill(0, 255, 0);
      noStroke();
      ellipse(x, y-25, 25, 25);
    }
  }
}

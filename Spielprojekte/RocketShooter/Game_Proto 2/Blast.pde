class Blast extends Entity {

  int energy;

  public Blast(Entity e, int fp) {
    this.x = e.x;
    this.y = e.y;
    speed = 10;
    visible = true;
    energy = fp;
  }

  public void update() {
    if (y>0) {
      y-=speed;
    } else {
      visible = false;
    }
  }

  public void draw() {
    stroke(255, 0, 0);
    strokeWeight(2);
    line(x, y-25, x, y-10);
  }
}

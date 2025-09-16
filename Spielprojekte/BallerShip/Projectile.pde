class Projectile {
  int size;
  color col;
  int x, y, speed;
  boolean visible;
  
  public Projectile(int x, int y, color c) {
    this.x = x;
    this.y = y;
    speed = 15;
    col = c;
    visible = true;
  }
  
  void update () {
    y-=speed;  
  }
  
  void draw() {
    if (visible) {
      stroke(col);
      strokeWeight(3);
      //point(x,y);
      line(x,y,x,y-30);
    }
  }
  
  public boolean visible() {
    if (y > 0) return true;
    else return false;
  }
}

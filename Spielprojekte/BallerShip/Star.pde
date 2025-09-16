class Star {
  int size;
  color col;
  int x, y;
  
  public Star(int size, color col, int x, int y) {
    this.size = floor(random(1,4));
    this.col = col;
    this.x=x;
    this.y=y;
  }
  
  void draw () {
    strokeWeight(size);
    stroke(col);
    point(x,y);
  }
}

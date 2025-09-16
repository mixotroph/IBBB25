class Shield {
  int x,y, duration, size;
  boolean blitz;
  
  
  public Shield(int x, int y, int size) {
    duration = 20;
    blitz = true;
    this.x = x;
    this.y = y;
    this.size = size+20;
  }
  
  void draw() {
    duration--;
    stroke(255,255,0);
    strokeWeight(size-duration);
    point(x,y);
    noStroke();
    if(0<duration-15) {
      fill(0,255,0,150);
    rect(width/2,height/2,width,height);
    }
  }
}

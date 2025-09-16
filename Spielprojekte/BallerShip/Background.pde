class Background {
  
  Star stars[] = new Star[100];
  int speed;
  
  public Background() {
    speed = 1;
    for (int i = 0; i< stars.length;i++) {
      stars[i] = new Star(floor(random(4,8)),color(255),floor(random(0,800)),floor(random(0,600)));
    }
  }
  
  void update() {
    for (int i = 0; i< stars.length;i++) {
      if (stars[i].y > 600) {
        stars[i].y = 0;
        stars[i].x = floor(random(0,800));
      }
      stars[i].y+=speed*stars[i].size;
    }
  }
  
  void draw () {
    for (int i = 0; i< stars.length;i++) {
      stars[i].draw();
    }
  }
}

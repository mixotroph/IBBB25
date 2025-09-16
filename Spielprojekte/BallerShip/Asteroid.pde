class Asteroid {
  int size, strength, xDirection;
  int x, y, speed, points;
  boolean  visible;
  PImage img;
  
  public Asteroid(int x, int y) {
    this.x = x;
    this.y = y;
    speed = floor(random(0,4));
    setSize();
    visible = true;
    points = strength;
    img = loadImage("asteroid.png");
    // Festlegen, ob die Asteroiden nah links oder rechts fliegen.
    xDirection = floor(random(-1,2));
    println(xDirection);
  }
  
   void hit() {
    strength-=1;
    if(strength<=0) {     
      visible = false;
      player.increasePoints(points);
      ex.add(new Explosion(x,y,size,points));
    }
   } 
  
  void setSize() {
    size = floor(random(30,60));
    strength = floor(size*0.2);
  }
  
  void update() {    
      if (y > 600 ) {
        y = -50;
        x = floor(random(0,800));
        setSize();
        visible = true;
      }
      
      if (x > width+100 ) {
        x = -50;
      } else 
      if (x < -100 ) {
        x = width+100;
      }
      
      y+=speed; 
      x+=speed * xDirection; 
  }
  
  void draw () {
    if (visible) {
      image(img,x,y,size,size);
    } 
  }
}

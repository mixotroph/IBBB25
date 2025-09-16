public class Asteroid extends Entity {
  
  ColissionChecker cc;
  boolean hit;
  int strength;

  public Asteroid() {
    cc = new ColissionChecker(this);
    x = (int) random(0,width);
    y = (int) random(-600,-50);
    speed = 2;
    image = loadImage("assets/meteorite.png");
    visible = true;
    hit = false;
    strength = 1;
  }
  
  public void update() {
    if (strength <= 0) {
      asteroids.remove(this);
    }
    
    // if asteroid leaves visible area, 
    // put him in a new random spot on top
    if (y<height) {
      y+=speed;
    } else {
      y = (int) random(-600,-50);
      x = (int) random(0,width);
    }
    
    // check if asteroid gets hit by a blast
    int index = cc.checkBlasts(p);
    if(index != 999) {
      strength -= p.blasts.get(index).energy;
      p.blasts.remove(index);
    }
  }
}

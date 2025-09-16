public class Entity {
  
  PImage image;
  int x, y;
  int speed;
  boolean visible;
  
  public void draw() {
    if (visible) {
      image(image,x,y,30,40); 
    }
  }
  
}

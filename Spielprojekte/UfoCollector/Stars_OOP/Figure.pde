public abstract class Figure {
 
  protected int xPos;
  protected int yPos;
  protected int size;
  protected boolean draw = true;
  protected PImage image;
  
  public Figure(int x, int y, int s) {
    xPos = x;
    yPos = y;
    size = s;
    imageMode(CENTER);
  }
  
  /**
  * Zeichnet die Figur
  */
  protected void draw(){

    image(image,xPos,yPos,size,size);
  } 
}

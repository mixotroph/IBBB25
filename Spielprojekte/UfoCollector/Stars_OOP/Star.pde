public class Star extends Figure{
  Random r = new Random();
  int rx = 0;
  int ry = 0 ;
  int speed = 0;
  int tick;  
  int points;  
  
  public Star (int x, int y, int s) {
    super(x,y,s);
    points = size;
    image = loadImage("star.png");
  }
  
  
  void checkBounds() {
    if (xPos < 0 || xPos > 640 || yPos < 0 || yPos > 480) draw = false;
  }
  
  void wobble() {
    if (tick == 0) {
       rx = r.nextInt(3)-1;
       ry = r.nextInt(3)-1;
       tick =  10;
    }
    if (xPos + rx*speed < 640 && xPos + rx*speed > 0) {xPos = xPos + rx*speed;}
    if (yPos + ry*speed < 480 && yPos + ry*speed > 25) {yPos = yPos + ry*speed;}
   
    tick--;
  }

}

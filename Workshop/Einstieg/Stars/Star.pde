public class Star {

  int xPos;
  int yPos;
  int size;
  boolean draw = true;
  int points;

  public Star (int x, int y, int s) {
    xPos = x;
    yPos = y;
    size = s;
    points = size;
  }

  void  draw() {
    stroke(255, 200, 0);
    ellipse(xPos, yPos, 10+size, 10+(size));
  }
}

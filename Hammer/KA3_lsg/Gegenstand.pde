class Gegenstand {

  int xPos, yPos;
  String name;
  boolean magnetisch;
  double gewicht;
  PImage bild;

  public Gegenstand(String img, String name, boolean magnetisch) {
    bild = loadImage(img);
    this.name = name;
    this.bild = bild;
    this.magnetisch = magnetisch;
    xPos = 400;
    yPos = -50;
  }

  public void update() {
    
    if (magnetisch) {
      if (yPos < 200) {
        yPos = yPos +2;
      } else if (xPos > 150) {
        xPos = xPos - 20;
        yPos = yPos +2;
      }
    } else {
      yPos++;
    }
    
    if (yPos > 700) {
      yPos = -100;
    }
  }

  public void draw() {
    image(bild, xPos, yPos);
  }
}

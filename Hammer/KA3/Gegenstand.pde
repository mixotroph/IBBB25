class Gegenstand {

  int xPos, yPos;
  String bezeichnung;
  boolean magnetisch;
  PImage bild;

  public Gegenstand(String img, String bezeichnung, boolean magnetisch) {
    xPos = 400;
    yPos = -50;

    bild = loadImage(img);
    this.bezeichnung = bezeichnung;
    this.magnetisch = magnetisch;
  }

  public void update() 
  {
    if (yPos < 700) {
      yPos = yPos + 3;
    } else {
      yPos = -100;
    }
  }

  public void draw() {
    image(bild, xPos, yPos);
  }
}

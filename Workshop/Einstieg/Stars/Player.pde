class Player {

  int xPos;
  int yPos;
  int xSpeed = 4;
  int ySpeed = 4;
  int d = 20;
  int points = 0;

  public Player(Keyhandler kh,int x, int y) {
    xPos = x;
    yPos = y;
  }

  public void draw() {
    stroke(255, 0, 0);
    ellipse(xPos, yPos, d, d);
  }

  public void move() {

    if (kh.up) yPos -= ySpeed;
    if (kh.down) yPos += ySpeed;
    if (kh.left) xPos -= xSpeed;
    if (kh.right) xPos += xSpeed;
  }

  public void collect() {
    for (int i = 0; i < stars.length; i++) {
      if (abs(stars[i].xPos-xPos) < 15 && abs(stars[i].yPos-yPos)<15) {
        if (stars[i].draw) points += stars[i].points;
        stars[i].draw = false;
      }
    }
  }
}

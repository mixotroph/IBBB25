class Player {

  int xPos, yPos, speed;
  Keyhandler kh;

  public Player(Keyhandler kh) {
    xPos = width/2;
    yPos = height/2;
    speed = 4;
    this.kh = kh;
  }

  public void update() {
    if (kh.w) yPos-=speed;
    if (kh.a) xPos-=speed;
    if (kh.s) yPos+=speed;
    if (kh.d) xPos+=speed;
  }

  public void draw() {
    rect(xPos, yPos, 20, 20);
  }
}

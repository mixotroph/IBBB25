class Player extends Figure {
  int xSpeed = 4;
  int ySpeed = 4;
  int points = 0;
  
  Item inventory[];
  int itemSpot = 0;

  public Player(int x, int y, int s) {
    super(x,y,s);
    image=loadImage("ufo.png");
    inventory = new Item[10];
  }
  
  public void move() {
    if (up && yPos>50) yPos -= ySpeed;  
    if (down && yPos < 480) yPos += ySpeed;
    if (left && xPos > 0) xPos -= xSpeed;
    if (right && xPos < 640 ) xPos += xSpeed;
  }
  
  public void collect() {
    for (int i = 0; i < stars.length; i++){
      if (abs(stars[i].xPos-xPos) < 25 && abs(stars[i].yPos-yPos)<25){
        if (stars[i].draw) points += stars[i].points;
        stars[i].draw = false; 
      }
    }
  }
    
  public void collectItem() {
  //  for (int i = 0; i < stars.length; i++){
      if (abs(it.xPos-xPos) < 25 && abs(it.yPos-yPos)<25){
        it.draw = false; 
        inventory[itemSpot] = it;
      }
  //  } 
  }
  
  
}

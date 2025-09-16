class Item extends Figure {
  int tick; 
  
  public Item(int x, int y, int s){
    super(x,y,s);
    tick = 0;
    image = loadImage("gem.png");
  } 
  @Override
  protected void draw() {
    pushMatrix();
    translate(this.xPos,this.yPos);
    rotate(radians(tick));
    image(image,0,0,size,size);
    popMatrix();
    tick++;
    tick++;
  }

}

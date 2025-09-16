class Explosion {
  int x,y, duration, duration_Text, size, points;
  PImage img;
  
  public Explosion(int x, int y, int size, int points) {
    duration = 20;
    duration_Text = 50;
    this.x = x;
    this.y = y;
    this.size = size+20;
    this.points = points;
    img = loadImage("explosion.png");
  }
  
  void draw() {
    duration--;
    duration_Text--;
    stroke(255,255,0,100+duration*8);
    strokeWeight(size-duration);
    point(x,y);
    //tint(255, 100+duration*8);
    //image(img,x,y,size-duration,size-duration);
    noStroke();
    
    // Wert anzeigen
    textSize(size-duration_Text);
    fill(0,0,255,100+duration_Text*10);
    text("+ "+points, x+20, y-20);
    
    // Bildschirm "aufblitzen" lassen
    if(0<duration-15) {      
      fill(255,255,255,150);
      rect(width/2,height/2,width,height);
    }
  }
}

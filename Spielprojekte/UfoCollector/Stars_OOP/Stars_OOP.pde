import java.util.Random;

// global Variables
Random r = new Random();
boolean up, down, left, right, refresh;

// Hintergrund
int sizeX = 640;
int sizeY = 480;
PImage bg;

// Figuren
Star stars[];
Item items[];
Player p;
Item it;

//Anfangslevel
int level = 1;


void setup () {
  size(640, 480);
  bg = loadImage("stars_bg.jpg");
  // Figuren anlegen
  p = new Player(r.nextInt(sizeX), r.nextInt(sizeY), 100);
  stars = new Star[10];
  items = new Item[10];
  it = new Item(200, 250, 20);
  
  //Sternenarray befüllen
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(r.nextInt(sizeX), r.nextInt(sizeY-25)+25, 15);
  } 
  //Sternenarray befüllen
  for (int i = 0; i < items.length; i++) {
    items[i] = new Item(r.nextInt(sizeX), r.nextInt(sizeY), 15);
  } 
}

void draw() {
  fill(200, 0, 0);
  background(bg);

  //Einsammeln
  p.collect();
  p.collectItem();

  
  if (refresh) {
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star(r.nextInt(sizeX), r.nextInt(sizeY-25)+25, 15);
      stars[i].speed=level;
    } 
    level++;
  }
  
  refresh = true;

  for (int i = 0; i < stars.length; i++) {
    if (stars[i].draw) {
      stars[i].draw();
      stars[i].wobble();
      stars[i].checkBounds();
      // Falls es noch einen Stern gibt, der gezeichnet werden soll:
      refresh = false; 
    }
  } 

  if (it.draw) it.draw();
  p.draw();
  p.move();

  // HUD
  stroke(255, 0, 0);
  rect(0, 0, 640, 25);
  textSize(24);
  fill(255);
  text("Punkte: ", 10, 20);
  text(p.points, 100, 20);
  text("Level: ", 520, 20);
  text(level, 600, 20);
  
  for (int i=0; i<p.inventory.length; i++) {
    if (p.inventory[i] != null) {
        image(p.inventory[i].image,200,12,20,20);
    }
  }
} 

public void keyPressed() {
  if (key == 'w') up = true;
  if (key == 'a') left = true;
  if (key == 's') down = true;
  if (key == 'd') right = true;
} 

public void keyReleased() {
  if (key == 'w') up = false;
  if (key == 'a') left = false;
  if (key == 's') down = false;
  if (key == 'd') right = false;
}

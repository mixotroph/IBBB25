import java.util.Random;

Random r = new Random();
Star stars[];
Keyhandler kh;
Player p;

void setup () {
  size(640, 480);
  kh = new Keyhandler();
  p = new Player(kh,r.nextInt(640), r.nextInt(480));
  stars = new Star[10];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(r.nextInt(640), r.nextInt(480), 1);
  }
}

void draw() {
  background(0);
  textSize(24);
  text("Punkte: ", 10, 20);
  text(p.points, 100, 20);
  p.draw();
  p.move();
  p.collect();

  if (kh.refresh) {
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star(r.nextInt(640), r.nextInt(480), 1);
    }
  }

  kh.refresh = true;
  for (int i = 0; i < stars.length; i++) {
    if (stars[i].draw) {
      stars[i].draw();
      kh.refresh = false;
    }
  }
}

public void keyPressed() {
  if (key == 'w') kh.up = true;
  if (key == 'a') kh.left = true;
  if (key == 's') kh.down = true;
  if (key == 'd') kh.right = true;
}

public void keyReleased() {
  if (key == 'w') kh.up = false;
  if (key == 'a') kh.left = false;
  if (key == 's') kh.down = false;
  if (key == 'd') kh.right = false;
}

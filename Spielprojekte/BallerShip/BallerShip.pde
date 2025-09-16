Sound soundplayer;

int x, y, speed, p;
boolean down, up, left, right, fire;

Player player;
CollisionChecker cc;
Gun g = new Gun();
Hud hud = new Hud();

Background space = new Background();
Asteroid asteroids[] = new Asteroid[6];

ArrayList<Explosion> ex = new ArrayList<Explosion>();
ArrayList<Projectile> firedProjectiles = new ArrayList<Projectile>();
ArrayList<Projectile> invisibleProjectiles = new ArrayList<Projectile>();

int collsionAt = 999;

void setup() {
  size(800, 600);
  x=100;
  y=100;
  speed = 4;
  p = 0;
  frameRate(60);
  for (int i = 0; i< asteroids.length; i++) {
    asteroids[i] = new Asteroid(
      floor(random(0, 800)), floor(random(0, 600)));
  }

  player = new Player(100, 100);
  cc = new CollisionChecker(player);
  rectMode(CENTER);
  imageMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  // Neuen Frame schwarz grundieren
  background(0);

  // Kollision mit Asteroiden?
  collsionAt = cc.checkAsteroids() ;
  if (collsionAt != 999) {
    stroke(0, 255, 0);
    strokeWeight(100);
    asteroids[collsionAt].visible = false;
    ex.add(new Explosion(asteroids[collsionAt].x, asteroids[collsionAt].y, asteroids[collsionAt].size, -10));
    player.hit();
  }

  // Wird ein Asteroid von einem Projektil getroffen?
  collsionAt = cc.checkProjectile() ;
  if (collsionAt != 999) {
    asteroids[collsionAt].hit();
  }

  // Hintergrund aktualisieren und zeichnen
  space.update();
  space.draw();
  player.update();

  // Projektile zeichnen
  for ( Projectile projectile : firedProjectiles) {
    projectile.update();
    if (!projectile.visible()) {
      invisibleProjectiles.add(projectile);
    } else {
      projectile.draw();
    }
  }
  // Unsichtbare Projektile entfernen
  firedProjectiles.removeAll(invisibleProjectiles);

  // Asteroiden updaten und zeichenn
  for (int i = 0; i< asteroids.length; i++) {
    asteroids[i].update();
    asteroids[i].draw();
  }

  // Spieler zeichenen
  player.draw();

  // Explosionen zeichnen
  Explosion temp=null;
  for ( Explosion e : ex) {
    if (e.duration_Text > 0) {
      e.draw();
    } else {
      temp = e;
    }
  }
  if (temp!=null) ex.remove(temp);

  // Statuszeile
  hud.showStatus();
}

void keyPressed() {
  if (key=='w') up=true;
  if (key=='s') down=true;
  if (key=='a') left=true;
  if (key=='d') right=true;
  if (key==' ') fire=true;
}

void keyReleased() {
  if (key=='w') up=false;
  if (key=='s') down=false;
  if (key=='a') left=false;
  if (key=='d') right=false;
  if (key==' ') fire=false;
}

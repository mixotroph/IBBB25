public class Player extends Entity {

  KeyHandler kh;
  ColissionChecker cc;
  Counter hc, bc;
  int energy;
  int reloadTime, firePower;
  boolean hit;
  ArrayList<Blast> blasts;
  int ammo;

  public Player(KeyHandler kh) {
    x = 100;
    y = 100;
    ammo = 100;
    speed = 5;
    energy = 100;
    visible = true;
    reloadTime = 50;
    firePower = 1;
    image = loadImage("assets/rocket.png");
    this.kh = kh;
    cc = new ColissionChecker(this);
    hc = new Counter();
    bc = new Counter();
    blasts = new ArrayList<Blast>();
  }

  public void update() {
    if (kh.a) {
      x-=speed;
    }
    if (kh.d) {
      x+=speed;
    }
    if (kh.w) {
      y-=speed;
    }
    if (kh.s) {
      y+=speed;
    }
    if (kh.space) {
      fire();
    }

    int index = cc.checkAsteroid();
    if (index != 999) {
      hit = true;
      asteroids.remove(index);
      energy-=20;
      if (energy <= 0) {
        gameOver();
      }
      hc.start();
    }

    int indexPU = cc.checkPowerUps();
    if (indexPU != 999) {
      ammo += powerUps.get(indexPU).ammo;
      powerUps.remove(indexPU);
      //energy+=20;
    }
  }

  private void fire() {
    if (ammo > 0) {
      if (bc.getDuration()>reloadTime) {
        blasts.add(new Blast(this, firePower));
        ammo -=1;
        bc.reset();
      }
    }
  }

  public void drawBlasts() {
    for (int i = 0; i< blasts.size(); i++) {
      Blast b = blasts.get(i);
      b.update();
      if (b.visible) {
        b.draw();
      } else {
        blasts.remove(i);
      }
    }
  }

  public void blink() {
    int blinkDuration = 500;
    int blinkIntervall = 100;

    if (hc.getDuration() < blinkDuration) {
      if (hc.getDuration() % blinkIntervall > 0 &&
        hc.getDuration() % blinkIntervall < blinkIntervall/2) {
        visible = false;
      } else {
        visible = true;
      }
    } else {
      hc.stop();
      visible = true;
      hit = false;
    }
  }
}

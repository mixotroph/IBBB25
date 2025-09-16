class ColissionChecker {

  Entity e;

  public ColissionChecker(Entity e) {
    this.e = e;
  }

  public int checkAsteroid() {

    for (int i = 0; i< asteroids.size(); i++) {
      Asteroid a = asteroids.get(i);
      if (abs(e.x - a.x) < 25 && abs(e.y - a.y) < 25) {
        return i;
      }
    }
    return 999;
  }

  public int checkPowerUps() {

    for (int i = 0; i< powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      if (abs(e.x - pu.x) < 25 && abs(e.y - pu.y) < 25) {
        return i;
      }
    }
    return 999;
  }

  public int checkBlasts(Player p) {
    for (int i = 0; i< p.blasts.size(); i++) {
      Blast b = p.blasts.get(i);
      //for (int j = 0; i< asteroids.size(); j++) {
      if (abs(b.x - e.x) < 25 && abs(b.y - e.y) < 25) {
        return i;
      }
      //}
    }
    return 999;
  }
}

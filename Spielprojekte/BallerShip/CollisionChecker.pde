class CollisionChecker {
 Player p;
  
  public CollisionChecker(Player p) {
    this.p = p;
  }
  
  public int checkAsteroids() {
     for (int i = 0; i< asteroids.length;i++) {
        if(abs(asteroids[i].x - p.x) < asteroids[i].size/2+p.size &&
          abs(asteroids[i].y - p.y) < asteroids[i].size/2+p.size && 
          asteroids[i].visible) {
            return i;
          }
     }
     return 999;
  }
  
  public int checkProjectile() {
    for (int i = 0; i< asteroids.length;i++) {
      for (Projectile p : firedProjectiles) {
        if(abs(asteroids[i].x - p.x) < asteroids[i].size/2 &&
          abs(asteroids[i].y - p.y) < asteroids[i].size/2 && 
          asteroids[i].visible) {
          p.visible = false;
            return i;
          }
       }
     }
     return 999;
  }
}

class Gun {
  
  int frequency;
  int startTime = millis();
  int delta;
  int fireDelay = 100;
 
  void fire() {
    int now = millis();
    delta =now-startTime;
    if (delta>fireDelay)
    {
      firedProjectiles.add(new Projectile(player.x,player.y,color(255,0,0)));
      delta=0;
      startTime = now;
    }
  }
}

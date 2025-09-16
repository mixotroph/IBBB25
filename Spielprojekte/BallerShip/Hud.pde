class Hud {

public Hud() {
}  
  
void showStatus() {
  fill(255);
  textSize(24);
  text("Power: "+player.power, 650, 50);
  text("Points: "+player.points, 650, 75);
}

}

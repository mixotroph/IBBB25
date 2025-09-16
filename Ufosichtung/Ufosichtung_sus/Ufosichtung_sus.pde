
int n = 300;
int[] rainX = new int[n];
int[] rainY = new int[n];

int bewegungsrichtung = 1;

// -------------------------------------------------------------------
// Hier beginnt die setup-Methode. 
// -------------------------------------------------------------------
void setup() {
  size(800, 600);
  size(800, 600);
  for (int i = 0; i < n; i++) {
    rainX[i] = int(random(0, 800));
    rainY[i] = int(random(-400, 0));
  }
  // ----------------------------------------
  // Ab hier ggf. die setup-Methode erweitern
  // ----------------------------------------
} // Ende Setup


// -------------------------------------------------------------------
// Hier beginnt die draw-Methode. 
// -------------------------------------------------------------------
void draw() {
  background(#515076);
  noStroke();
  // -------------------------------------------------------------------
  // Hier beginnt Aufgabe 1 und 2
  // -------------------------------------------------------------------



  fill(#507656);
  rect(0, 550, 800, 50);
}
// ------------------------------------------------------------------------------
// Hier endet die draw-Methode. 
// Unterhalb dieser Zeile dürfen keine Anpassungen/Ergänzungen vorgenommen werden!
// ------------------------------------------------------------------------------

void starteRegen() {
  // Anfang Regenanimation
  strokeWeight(2);
  stroke(200, 200, 255);
  for (int i = 0; i < n; i++) {
    line(rainX[i], rainY[i], rainX[i], rainY[i]+20);
    rainY[i]+=int(random(8, 15));
    if (rainY[i] > 550) {
      rainY[i] = int(random(-400, 0));
    }
  }

  if (frameCount % 100 == 0 || frameCount % 110 == 0) {
    fill(255, 255, 255);
    rect(0, 0, 800, 600);
  }
  stroke(0, 0, 0);
  strokeWeight(1);
  // Ende Regenanimation
}


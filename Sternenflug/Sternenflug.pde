int starsN = 50; // Sternenanzahl
int starsV = 5; // Sternengeschwindigkeit

int starsX[] = new int[starsN]; // Array für die X-Koordinaten der Sterne
int starsY[] = new int[starsN]; // Array für die Y-Koordinaten der Sterne

void setup() {
  size(800, 600); // Größe des "Bildschirms" (Koordinatensystem)

  /*
  Erstellung der Sterne mithilfe einer Zählschleife
   */
  for (int i = 0; i<starsN; i++) {
    starsX[i]=int(random(800));
    starsY[i]=int(random(600));
  }
}

void draw() {
  background(0);
  strokeWeight(4);
  stroke(255);

  /*
    1) Zeichnen der Sterne
   2) Bewegung der Sterne
   */
  for (int i = 0; i<starsN; i++) { // Schleifenkopf mit Fortlaufbedingung
    point(starsX[i], starsY[i]);
    starsY[i]+=starsV;
    if (starsY[i] > 600) {
      starsY[i] = 0;
    }
  }
}

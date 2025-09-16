int ballX = 200;
int ballY = 375;

int rectX = 200;
int rectY = 375;

int speedX = 0;
int speedY = -2;

int maxSpeed = 5;

// Targets
int nTar = 24;

int[] tarX = new int[nTar];
int[] tarY = new int[nTar];
boolean[] tarV = new boolean[nTar];

void setup() {
  //Spielfeldgröße festlegen
  size(400, 400);
  for (int i=0; i < nTar; i++) {
    tarX[i] = (50*i+5)%400;
    tarY[i] = 20*(1+(i/8));
    tarV[i] = true;
  }
}

void draw() {
  background(50);

  // Farbe der Ziele
  fill(50, 50, 200);

  // Ziele zeichnen
  for (int i=0; i < nTar; i++) {
    if (tarV[i]) {
      rect(tarX[i], tarY[i], 40, 15);
    }
  }  

  // Kollisionserkennung
  // Ziele
  for (int i=0; i < nTar; i++) {
    
    boolean tHorizontal = ballX >= tarX[i] && ballX <= tarX[i]+40;
    boolean tYUnterseite = ballY == tarY[i]+15;

    if (tHorizontal && tYUnterseite && tarV[i]) {
      speedY=speedY*(-1);
      tarV[i] = false;
    }
  }  

  // Obere und untere Spielfeldgrenzen
  if (ballY <= 0 || ballY > 400) {
    speedY=speedY*(-1);
  } 
  // Oberfläche des Rechtecks
  else if (ballX >= rectX && ballX <= rectX+50 && ballY == 375) {
    speedY=speedY*(-1);
    int newSpeed = speedX+abs(pmouseX-mouseX);
    if (newSpeed < maxSpeed) {
      speedX=newSpeed;
    } else {
      speedX=maxSpeed;
    }
  } 
  // Seitenwände des Spielfelds
  else if (ballX < 0 || ballX > 400-5 ) {
    speedX=speedX*(-1);
  }

  // Farbe des Spielballs
  fill(200, 0, 0);
  // Spielball zeichnen
  ellipse(ballX, ballY, 10, 10);

  ballX+=speedX;
  ballY+=speedY;

  // Farbe "Spieler"
  fill(30);
  rectX=mouseX;
  rect(rectX, 380, 50, 10);
}

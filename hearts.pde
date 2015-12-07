// make sure to have heart.png in the same folder

PImage heart0;

int heartNumber = 50;
float heartTime = 1;
PVector heartLoc[];
PVector heartDir[];
float heartScale[];
float heartRotate[];
float heartAlpha[];

void setup() {
  size(1280, 720);
  smooth();
  heart0 = loadImage("heart.png");
  heart0.loadPixels();

  // initializing arrays for heart 
  heartLoc = new PVector[heartNumber];
  heartDir = new PVector[heartNumber];
  heartScale = new float[heartNumber];
  heartRotate = new float[heartNumber];
  heartAlpha = new float[heartNumber];

  for (int i = 0; i < heartNumber; i++) {
    heartLoc[i] = new PVector(random(width/2-300, width/2+300), random(height/2-200, height-200));
    heartDir[i] = new PVector(random(-0.4, 0.4), random(-1, -2));
    heartScale[i] = random(0.15, 0.45);
    heartRotate[i] = random(radians(-25), radians(25));
    //heartAlpha[i] = 255;
  }
}

void draw() {
  background(18, 170, 190);
  heartAnimate();
  for (int i = 0; i < heartNumber; i++) {
    drawHeart(heartLoc[i].x, heartLoc[i].y, heartScale[i], heartRotate[i], heartAlpha[i]);
  }
}

void drawHeart (float heartTranslateX, float heartTranslateY, float heartScale, float heartRotate, float heartAlpha) {
  pushMatrix();
  translate(heartTranslateX, heartTranslateY);
  rotate(heartRotate);
  scale(heartScale);
  image(heart0, 0, 0);
  popMatrix();
}

void heartAnimate () {
  for (int i = 0; i < heartNumber; i++) {
    heartLoc[i].x = heartLoc[i].x + heartDir[i].x*heartTime;
    heartLoc[i].y = heartLoc[i].y + heartDir[i].y*heartTime;
  }
}  

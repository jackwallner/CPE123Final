// "ManyFish" (to distinguish from the lone fish, which will be named 'LoneFish')
// Not "Articulated" Yet

// declare arrays for 'ManyFish'
int nManyFish = 20;
float  pxManyFish[] = new float[nManyFish];
float  pyManyFish[] = new float[nManyFish];
float  vxManyFish[] = new float[nManyFish];
float  vyManyFish[] = new float[nManyFish];
color  colorManyFish[] = new color[nManyFish];

void setup() {
  size(1280, 720);

  // initialize arrays for 'ManyFish'
  for (int loopManyFish = 0; loopManyFish < nManyFish; loopManyFish++) {
    pxManyFish[loopManyFish] = random(30, 500);
    pyManyFish[loopManyFish] = random(20, 580);
    vxManyFish[loopManyFish] = random(2, 4);
    vyManyFish[loopManyFish] = random(-1, 1);
    colorManyFish[loopManyFish] = color(random(0, 255), random(0, 255), random(0, 255));
  }
}

void draw() {
  background(14, 154, 178);

  // draw 'ManyFish' on screen
  for (int loopManyFish=0; loopManyFish < nManyFish; loopManyFish++) {
    ManyFish(pxManyFish[loopManyFish], pyManyFish[loopManyFish], random(0, PI/20), random(0.3, 0.35), colorManyFish[loopManyFish]);
    pxManyFish[loopManyFish] += vxManyFish[loopManyFish];
    pyManyFish[loopManyFish] += vyManyFish[loopManyFish];
  }
}

void ManyFish (float txManyFish, float tyManyFish, float rotateManyFish, float scaleManyFish, color colorManyFish) {

  // [Scale, Rotate, Translate Entire Fish]
  pushMatrix();
  translate(txManyFish, tyManyFish);
  rotate(rotateManyFish);
  scale(scaleManyFish);

  fill(colorManyFish);
  noStroke();
  // Body (made up of two triangles on two sides and one ellipse in the middle)
  ellipse(0, 0, 197, 69); // Body | Middle
  triangle(-150, 0, -50, -30, -50, 30); // Body | Left
  triangle(50, -30, 150, 0, 50, 30);  // Body | Right

  // Tails
  pushMatrix();
  translate(-145, 0);
  stroke(colorManyFish);
  strokeWeight(6);
  line(0, 0, -37, -22);
  line(0, 0, -37, 22);
  popMatrix();

  // Eye
  fill(255);
  stroke(255);
  ellipse(72, -7, 4, 4);

  popMatrix(); // END [Scale, Rotate, Translate Entire Fish]
}

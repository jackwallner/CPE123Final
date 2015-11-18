//This is the code for the seaweed, the way it works is super messy but it works.

float theta=0.0;
float zeta=0.0;
float beta=0.0;
float eta=0.0;

boolean swap;

//option to have the circles move and randomly change or to have different starting values using an array


void wave(int posX, int posY, float uheta, float aeta, float ceta, float feta) {
  fill(12,148,110);
  theta+=uheta;
  zeta+=aeta;
  beta+=ceta;
  eta+=feta;
  float z = zeta;
  float q = theta;
  float b = beta;
  float e = eta;
  float y;
  if (swap == false){
  for (int i=0; i < 25 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, 148-i*0.5, 110-i*0.5);
    y = sin(z)*50/2;
    pushMatrix();
    rotate(radians(270));
    translate((i*5)-425+posX, y+posY+400);
    ellipse(0,0, 25, 25);
    popMatrix();
    z+=50/250f;
  }
  for (int i=0; i < 50 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(q)*50/2;
    pushMatrix();
    rotate(radians(300));
    translate((i*5)-150+posX, y+posY+580);
    ellipse(0,0, 15, 15);
    popMatrix();
    q+=50/250f;
  }
  for (int i=0; i < 40 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(e)*50/2;
    pushMatrix();
    rotate(radians(240));
    translate((i*5)-600+posX, y+posY+175);
    ellipse(0,0, 30, 30);
    popMatrix();
    e+=50/250f;
  }
  for (int i=0; i < 40 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(b)*50/2;
    pushMatrix();
    rotate(radians(255));
    translate((i*5)-525+posX, y+posY+330);
    ellipse(0,0, 20, 20);
    popMatrix();
    b+=50/250f;
  }
  fill(12,148,110);
  //fill(12,148,110);
  ellipse(posX+425, posY+410, 150,100);
  } else if (swap == true) { 
    for (int i=0; i < 35 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, 148-i*0.5, 110-i*0.5);
    y = sin(q)*50/2;
    pushMatrix();
    rotate(radians(270));
    translate((i*5)-425+posX, y+posY+400);
    ellipse(0,0, 25, 25);
    popMatrix();
    q+=50/250f;
  }
  for (int i=0; i < 35 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(z)*50/2;
    pushMatrix();
    rotate(radians(300));
    translate((i*5)-150+posX, y+posY+580);
    ellipse(0,0, 15, 15);
    popMatrix();
    z+=50/250f;
  }
  for (int i=0; i < 35 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(b)*50/2;
    pushMatrix();
    rotate(radians(240));
    translate((i*5)-600+posX, y+posY+175);
    ellipse(0,0, 30, 30);
    popMatrix();
    b+=50/250f;
  }
  for (int i=0; i < 30 ;i++) {
    fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
    //fill(12, (int)148-i*0.5, (int)110-i*0.5);
    y = sin(e)*50/2;
    pushMatrix();
    rotate(radians(255));
    translate((i*5)-525+posX, y+posY+330);
    ellipse(0,0, 20, 20);
    popMatrix();
    e+=50/250f;
  }
  fill(12,148,110);
  //fill(12,148,110);
  ellipse(posX+425, posY+410, 150,100);
    
}
}

void setup() {
  size(800, 400);
  swap = false;
  noStroke();
}

void draw() {
  background(255);
  /*pushMatrix();
  scale(0.5);
  translate(400,400);
  wave(0, 0);
  popMatrix();
  */
  //seaweeds(-100,-100,1.25);
  swap = false;
  seaweeds(0,0,1, 0.05);
  swap = true;
  seaweeds(0,400,0.5, 0.05);
}

void seaweeds(int x, int y, float scaleS, float greta){
  pushMatrix();
  scale(scaleS);
  translate(x,y);
  wave(0,0, greta/6, greta/7, greta/4, greta/5);
  popMatrix();
}

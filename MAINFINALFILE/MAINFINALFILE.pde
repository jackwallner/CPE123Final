//Jennifer, Jack, Thang, Kayleigh
// Main File for the CPE 123 Project
//clicks
boolean c1=false; 
boolean c2=false;
boolean c3=false;
boolean c4=false;
boolean c5=false;
boolean c6=false;
boolean c7=false;

//Timeline
int scene;
int s1;
int s2;

// background sound stuff
import processing.sound.*;
SoundFile file;

// sky stuff
PImage sky0;
PVector skyLoc;
PVector skyDir;
float skyTime = 1;

// hearts stuff
PImage heart0;
int heartNumber = 40;
float heartTime = 1.75;
PVector heartLoc[];
PVector heartDir[];
float heartScale[];
float heartRotate[];
float heartAlpha[];

// stuff for bubbles
int bubblesNumber = 150;
float bubblesTime = 2;
PVector bubblesLoc[];
PVector bubblesDir[];
PVector bubblesDir2[];
float bubblesScale[];
float bubblesRotate[];
color bubblesStrokeColor[];
color bubblesColor[];
float bubblesDiameter[];

/* DECLARE VARIABLES */
// for fish
int fishNumber = 22;
float fishTime = 9;
float fishEyeMove = 0, fishTailMove = 0;
boolean fishTailSwitch = false;
//boolean fishAnimate = false;
// for FirstFish
int FirstFishNumber = 1;
float FirstFishTime = 2.2;
float FirstFishEyeMove = 0, FirstFishTailMove = 0;
boolean FirstFishTailSwitch = false;
boolean FirstFishAnimate = false;
float fx, fy;
// for seaweeds
float theta=0.0;
float zeta=0.0;
float beta=0.0;
float eta=0.0;
int end1;
int swap;
int px;
int py;
// for sea monster
float monsterzeta=0;
// for boat
float bpy;
float brotate;
boolean boatD = false;
boolean boatP = false;

/* DECLARE ARRAYS */
// for fish
PVector fishLoc[];
PVector fishDir[];
float fishScale[];
float fishRotate[];
color fishColor[];
color fishEyeColor[];
// for FirstFish
PVector FirstFishLoc[];
PVector FirstFishDir[];
float FirstFishScale[];
float FirstFishRotate[];
color FirstFishColor[];
color FirstFishEyeColor[];



float vx=-5;
float vy=0;
//background color

color underwater;
color sky;
color bC;

// Declare Arrays for seaweed

int sweedY[];
int sweedYback[];
int back[];

//moving above water

float wy;
int waterlevel;

// net;

float nx;
float netRotate=0;
float netScale=0;
int nety=420;
int netx=740;

int timefornet = 0;

// new fishes;
int numFish=15;
int fpx[], fpy[];
color  fpatcolor;
int fcolshade[];
color fishcolor[], fishcolorface[];
float fishscale[];
float ffx[], ffy[], fvx[], fvy[];

//moving fish back

float f1x;

//seamonster delay

float mmx;

//seamonster reenter

int ppx, ppy;

//Setup Function
void setup() {
  size(1280, 720);
  smooth();
  background(18, 170, 190);
  //seaweed setup
  s1 = 500;
  s2 = 0;
  swap = 0;
  scene = 0;
  fx = width*1.15;
  fy = height/2-120;
  px = -800;
  py = height/2;
  wy = -100;
  //boat setup
  brotate = 0;
  bpy= -425;

  // background sound stuff
  file = new SoundFile(this, "backgroundmusic.mp3");
  file.play();

  // sky stuff
  sky0 = loadImage("sky.jpg");
  skyLoc = new PVector(0, -sky0.height-75);
  skyDir = new PVector(0, 2);
  // hearts stuff
  heart0 = loadImage("heart.png");
  heart0.loadPixels();
  // initializing arrays for heart 
  heartLoc = new PVector[heartNumber];
  heartDir = new PVector[heartNumber];
  heartScale = new float[heartNumber];
  heartRotate = new float[heartNumber];
  heartAlpha = new float[heartNumber];
  for (int i = 0; i < heartNumber; i++) {
    heartLoc[i] = new PVector(random(250, width-250), random(1.05*height, 1.55*height));
    heartDir[i] = new PVector(random(-0.7, 0.7), random(-2, -3));
    heartScale[i] = random(0.2, 0.5);
    heartRotate[i] = random(radians(-30), radians(30));
    //heartAlpha[i] = 255;
  }



  // initializing arrays for bubbles 
  bubblesLoc = new PVector[bubblesNumber];
  bubblesDir = new PVector[bubblesNumber];
  bubblesDir2 = new PVector[bubblesNumber];
  bubblesScale = new float[bubblesNumber];
  bubblesRotate = new float[bubblesNumber];
  bubblesColor = new color[bubblesNumber];
  bubblesStrokeColor = new color[bubblesNumber];
  bubblesDiameter = new float[bubblesNumber];
  for (int i = 0; i < bubblesNumber; i++) {
    bubblesLoc[i] = new PVector(random(-20, width+20), random(height+20, 5*height));
    bubblesDir[i] = new PVector(random(-0.2, 0.2), random(-1.5, -1));
    bubblesScale[i] = random(1.5, 4.5);
    //bubblesRotate[i] = random(radians(-30), radians(30));
    bubblesColor[i] = color(random(92, 115), random(220, 255), random(240, 255), random(30, 100));
    bubblesStrokeColor[i] = color(random(92, 115), random(220, 255), random(240, 255), random(5, 25));
    //bubblesDir2[i] = mult(bubblesDir[i], -1);
    //bubblesDir2[i] = PVector.mult(bubblesDir[i], -1);
    //bubblesDiameter[i] = random(40, 75);
  }

  // initializing arrays for fish 
  fishLoc = new PVector[fishNumber];
  fishDir = new PVector[fishNumber];
  fishScale = new float[fishNumber];
  fishRotate = new float[fishNumber];
  fishColor = new color[fishNumber];
  fishEyeColor = new color[fishNumber];
  // for fish
  for (int i = 0; i < fishNumber; i++) {
    fishLoc[i] = new PVector(width*-.8, (height-70)/fishNumber*i+40);
    fishDir[i] = new PVector(random(0.8, 1.7), 0);
    fishScale[i] = random(0.2, 0.7);
    //fishRotate[i] = random(radians(-30), radians(30));
    fishColor[i] = color(random(50, 255), random(random(0, 140), random(200, 255)), random(random(0, 160), random(220, 255)));
    fishEyeColor[i] = color(random(225, 255));
  }

  // initializing arrays for FirstFish 
  FirstFishLoc = new PVector[FirstFishNumber];
  FirstFishDir = new PVector[FirstFishNumber];
  FirstFishScale = new float[FirstFishNumber];
  FirstFishRotate = new float[FirstFishNumber];
  FirstFishColor = new color[FirstFishNumber];
  FirstFishEyeColor = new color[FirstFishNumber];
  // for FirstFish
  for (int i = 0; i < FirstFishNumber; i++) {
    FirstFishLoc[i] = new PVector(width*1.15, height/2-120);
    FirstFishDir[i] = new PVector(-1, 0);
    FirstFishScale[i] = -1;
    FirstFishRotate[i] = random(radians(-30), radians(30));
    FirstFishColor[i] = color(200, 0, 0);
    FirstFishEyeColor[i] = color(255);
  }



  //seaweed transition vectors
  sweedY = new int[7];
  sweedY[0] = 320;
  sweedY[1] = 1040;
  sweedY[2] = 1040;
  sweedY[3] = 80;
  sweedY[4] = 1040;
  sweedY[5] = 320;
  sweedY[6] = 1040;

  sweedYback = new int[7];
  sweedYback[0] = 320;
  sweedYback[1] = 1040;
  sweedYback[2] = 1040;
  sweedYback[3] = 80;
  sweedYback[4] = 1040;
  sweedYback[5] = 320;
  sweedYback[6] = 1040;

  back = new int[7]; 
  for (int i = 0; i < 7; i++) {
    back[i] = sweedYback[i] + 500;
  }

  //background colors

  underwater = color(18, 170, 190);
  sky = color(255);

  //water

  waterlevel = 200;

  nx = 1;

  //newfishes
  ffx = new float [numFish];
  ffy = new float[numFish];
  fvx = new float[numFish];
  fvy = new float[numFish];
  fishcolor = new color[numFish];
  fishscale = new float[numFish];
  for (int i=0; i<numFish; i++) {
    ffx[i] = random(-45, -40);
    ffy[i] = random(20, 280);//hmmm
    fvx[i] = random(PI+0.4, TWO_PI-0.5);
    fishcolor[i] = color(random(0, 20), random(20, 200), random(100, 255));
    fishscale[i] = random(1, 3);
  }

  //moving the fish back

  f1x = 700;

  //seamonster delay;

  mmx = 0;

  //seamonster reenter

  ppx = -800;
  ppy = height/2;
}


//Draw Function
void draw() {

  // testing how the underwater background works

  if (scene == -1) {
    bC = underwater;
    background(bC);
    nx = nx + 0.01*nx;
  }

  noStroke();
  //Seaweed, feel free to play around and move it accordingly
  swap = 0;
  if ((scene >= 0) && (scene < 4)) {
    bC = underwater;
    background(bC);
    seaweeds(0, 320, 1, 0.03);  
    seaweeds(1000, 1040, 0.5, 0.03);
    swap = 1;
    seaweeds(0, 1040, 0.5, 0.03);
    seaweeds(375, 80, 1.5, 0.03);
    swap = 2;
    seaweeds(800, 1040, 0.5, 0.03);
    seaweeds(500, 320, 1, 0.03);
    swap = 0;
    seaweeds(-200, 1040, 0.5, 0.03);
  }

  if ((scene <= 0)) {
    fill(255);
    textSize(40);
    text("Click anywhere to start!", 25, 50);
  }
  if  (scene>=0 && scene<=4) {
    // stuff for bubbles
    bubblesAnimate();
    for (int i = 0; i < bubblesNumber; i++) {
      //bubblesTime+=-0.1;
      drawBubbles(bubblesLoc[i].x, bubblesLoc[i].y, bubblesScale[i], bubblesRotate[i], bubblesColor[i], bubblesStrokeColor[i], bubblesDiameter[i]);
    }
  }

  // Scene 1 (first fish appears)
  if ((scene >= 1) && (scene <= 4)) {

    FirstFishAnimate();

    if (fx > 700) {

      fx += vx;
      //fy += vy;
      fy+=2*sin(radians(fx)); //first fish wave
      drawFirstFish(fx, fy, -0.75, 0, #C80000, 255, 10);
    }
    if (fx <= 700) {
      if (scene == 1) {
        drawFirstFish(fx, fy, -0.75, 0, #C80000, 255, 10);
      }
      if (px < -200) {
        drawFirstFish(fx, fy, -0.75, 0, #C80000, 255, 10);
        //println("nah");
      }
      if ((px >= -200) && (scene <= 2)) {
        drawFirstFish(700, fy, -.75, random(radians(-4), radians(4)), #C80000, color ((int)random(175, 255), (int)random(150, 255), (int)random(150, 255)), random(12, 18));
        //println("shake");
      }
      if (scene == 3) {
        float vx;
        float vy;
        float v1x;
        vx = -3;
        v1x = 10;
        vy = 0;
        fx += vx;
        fy += vy;

        f1x += v1x;


        drawFirstFish(f1x, fy, -.75, random(radians(-4), radians(4)), #C80000, color ((int)random(175, 255), (int)random(150, 255), (int)random(150, 255)), random(12, 18));
      }
    }

    if ((fx <= 700) && (c2==false)) {
      fill(255);
      textSize(40);
      text("Click the red fish!", 25, 50);
    }
  }



  //Scene 2 (sea monster appears)
  if (scene == 2) {
    fill(underwater);
    rect(0, 0, 150, 75);
    //fill(bC);
    textSize(40);
    text("██████████████", 25, 50);
    //println(px);

    if (px > -500) {
      fill(255);
      textSize(40);
      text("!!", 650, 200);
    }
    if (px < -100) {
      float vx;
      float vy;
      vx = 6;
      vy = -1;
      //vy = 1*sin(radians(359));
      px += vx;
      py += vy;
      //println(px);
      drawMonster(px, py, 0.5);
    }
    if (px >= -100) {
      drawMonster(-100, py, 0.5);
      //println("done");
    }
    if (px >=-100) {
      fill(255);
      textSize(40);
      text("Click the sea monster!", 25, 50);
    }
  }

  // Scene 3 (bunch of fish come out after sea monster)
  if ((scene >= 3) && (scene <= 4)) {
    fill(underwater);
    rect(0, 0, 150, 75);
    fishAnimate();

    //Fat Fishes
    for (int i=0; i<numFish; i++) {
      pushMatrix();
      scale(fishscale[i]);
      translate(ffx[i]-500, ffy[i]);
      fill(fishcolor[i]);
      ellipse(0, 0, 50, 40); //body
      triangle(-20, 0, -35, -10, -35, 10);
      fill(255);
      ellipse(10, 0, 20, 35);
      ellipse(12, 0, 25, 30);
      fill(fishcolor[i]);
      ellipse(12, -4, 6, 6);
      popMatrix();
      //fish wave
      ffx[i] += fvx[i];
      ffy[i] += 2*sin(radians(ffx[i]));
      if (ffx[i] > 500) {
        ffx[i] += 2*fvx[i];
      }
    }


    for (int i = 0; i < fishNumber; i++) {
      //fish(fishLoc[i].x, fishLoc[i].y, fishScale[i], fishRotate[i], fishColor[i], 255);
      drawFish(fishLoc[i].x, fishLoc[i].y, fishScale[i], fishRotate[i], fishColor[i], 255);
      // Code to increase fish's speed when approaching monster
      if (fishLoc[i].x >= 100 && fishLoc[i].x <= 200 ) {
        fishTime+=0.01;
      }
      if (fishLoc[i].x > 200 && fishLoc[i].x <= 400 ) {
        fishTime+=0.04;
      }
      if (fishLoc[i].x > 400 && fishLoc[i].x <= 1000 ) {
        fishTime+=0.07;
      }
    }




    float vx;
    float vy;
    vx = 4;
    vy = 1*sin(radians(359));

    mmx += vx;
    //println(mmx);
    if (mmx < 100) {
      drawMonster(px, py, 0.5);
    }
    if (mmx >= 100) {
      px += vx * 3.5;
      py += vy;
      drawMonster(px, py, 0.5);
    }
    if (px >= 3500) {
      fill(255);
      textSize(40);
      text("Click anywhere!", 25, 50);
    }
  }



  // SCENE 4 TRANSITION ABOVE WATER

  if ((scene == 4) || (scene == 5)) {

    int vy;
    vy = 2;
    background(bC);
    fill(underwater);

    if (wy < height - waterlevel) {
      wy += vy;
      rect(0, wy, width, height+waterlevel);
      //fill(sky);
      // rect(0, wy-(height+waterlevel), width, height+waterlevel);
      bC = sky;


      for (int i = 0; i < 7; i++) {
        sweedY[i] += vy;
      }
      seaweeds(0, sweedY[0], 1, 0.03);  
      seaweeds(1000, sweedY[1], 0.5, 0.03);
      swap = 1;
      seaweeds(0, sweedY[2], 0.5, 0.03);
      seaweeds(375, sweedY[3], 1.5, 0.03);
      swap = 2;
      seaweeds(800, sweedY[4], 0.5, 0.03);
      seaweeds(500, sweedY[5], 1, 0.03);
      swap = 0;
      seaweeds(-200, sweedY[6], 0.5, 0.03);
    } else {
      fill(underwater);
      rect(0, wy, width, height+waterlevel);
      //  fill(sky);
      //  rect(0, wy-(height+waterlevel), width, height+waterlevel);
    }


    // code to make bubbles go down 
    bubblesAnimate();
    for (int i = 0; i < bubblesNumber; i++) {
      if (bubblesLoc[i].y > -50) {
        bubblesDir[i] = new PVector(random(-0.1, 0.1), random(1.1, 1.4));
        drawBubbles(bubblesLoc[i].x, bubblesLoc[i].y, bubblesScale[i], bubblesRotate[i], bubblesColor[i], bubblesStrokeColor[i], bubblesDiameter[i]);
      }
    }
  }

  //SCENE 5 WITH BOAT

  if (scene == 4 || scene ==5) {

    // sky stuff for scene 5
    skyAnimate();
    if (skyLoc.y <= 0) {
      drawSky(skyLoc.x, skyLoc.y, 1, 0);
    } else {
      skyLoc.x = 0;
      skyLoc.y = 0;
      drawSky(skyLoc.x, skyLoc.y, 1, 0);
    }

    boatP=true;

    drawBoat();
    animateBoat();
    //boats position
    if (boatP==true) {
      bpy+=2;
    } else {
      bpy -= 2;
    }
  }
  if (scene == 4||scene ==5) {
    if (bpy >=200) {
      bpy=200;
    }
    if (wy >= 520 && nety <= 1000) {
      fill(255);
      textSize(40);
      text("Click the fisherman!", 25, 50);
    }
  }
  //SCENE 5 WHEN CLICK FISHER, NET DROP
  if (scene ==5) {

    net(netx, nety, netScale, netRotate);
    for (int i=1; i<2000; i++) {
      netRotate +=1;
    }
    netx+=3;
    nety+=6;
    netScale+=0.05;

    fill(0);
    textSize(20);
    text("MEH...", 830, 350);

    if (nety >= 1000) {
      fill(255);
      textSize(40);
      text("Click the boat!", 25, 50);
    }
  }

  //SCENE 6 TRANSITION BACK UNDERWATER
  if (scene == 6) {



    background(bC);
    float vy;
    vy = -2;
    fill(underwater);
    wy += vy;
    rect(0, wy, width, height+waterlevel+2);
    if (wy<=0) {
      wy=0;
      bC = underwater;
    }

    if (nety == back[3]+210) {
      fill(255);
      textSize(40);
      text("Click the net!", 25, 50);
    }
    boatP=false;

    // sky stuff for scene 6
    skyAnimate();
    skyDir = new PVector(0, -2);
    drawSky(skyLoc.x, skyLoc.y, 1, 0);

    drawBoat();
    animateBoat();
    //boats position
    if (boatP==false) {
      bpy-=2;
      if (bpy<=-20) {
        bpy-=.3;
      }
    } 


    for (int i = 0; i < 7; i++) {
      if (back[i] > sweedYback[i]) {
        back[i] += vy;
      }
    }




    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);

    //FISH STUFF 
    drawFirstFish(fx, fy, -.50, radians(10), #C80000, 255, 10);
    FirstFishAnimate();
    fx=895;
    fy=back[3]+210;

    //NET STUFF
    net(netx, nety, netScale, netRotate);
    netScale=3.5;
    netx=890; //ADJUST HERE FOR NET POSTITION!
    nety=back[3]+210;
  }

  //SCENE 7 HAPPY SEAMONSTER ENTERS AND FREES FISH

  if (scene == 7) {
    background(underwater);
    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);

    //FISH STUFF 
    drawFirstFish(fx, fy, -.50, radians(10), #C80000, 255, 10);
    FirstFishAnimate();
    fx=895;
    fy=back[3]+210;

    //NET STUFF
    net(netx, nety, netScale, netRotate);
    netScale=3.5;
    netx=890; //ADJUST HERE FOR NET POSTITION!
    nety=back[3]+210;
    //  netRotate=radians(random(-3,3));

    fill(255);
    textSize(40);
    text("!!", random(850, 900), random(150 + 60, 200 + 60));

    //sea monster enters

    noStroke();
    if (ppx < 100) {
      float vx;
      float vy;
      vx = 6;
      vy = -1;
      ppx += vx;
      ppy += vy;
      drawMonster(ppx, ppy + 60, 0.5);
    }
    if (ppx >= 100) {
      drawMonster(100, ppy + 60, 0.5);
    }
    if (ppx == 100) {
      fill(255);
      textSize(40);
      text("Click the sea monster!", 25, 50); 
      textSize(20);
      text("hm...", 740, 150 + 60);
    }
  }

  //scene 8 sea monster breaks fish free

  if (scene == 8) {
    background(underwater);
    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);

    //FISH STUFF 
    drawFirstFish(fx, fy, -.50, radians(10), #C80000, 255, 10);
    FirstFishAnimate();
    fx=895;
    fy=back[3]+210;

    //NET STUFF
    net(netx, nety, netScale, netRotate);
    netScale=3.5;
    netx += -vx; //ADJUST HERE FOR NET POSTITION!
    nety=back[3]+210;

    noStroke();
    if (ppx < 400) {
      float vx;
      float vy;
      vx = 6;
      vy = 0;
      ppx += vx;
      ppy += vy;
      drawMonster(ppx, ppy + 60, 0.5);
      fill(255);
      textSize(20);
      text("*sigh*", ppx + 650, 155 + 60);
    }
    if (ppx >= 400) {
      drawMonster(400, ppy + 60, 0.5);
    }
    if (ppx == 400) {
      fill(255);
      textSize(40);
      text("Click the monster!", 25, 50);
    }
  }

  //scene 9 sea monster moves back
  if (scene == 9) {
    background(underwater);
    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);

    //FISH STUFF 
    drawFirstFish(fx, fy, -.50, radians(10), #C80000, 255, 10);
    FirstFishAnimate();
    fx=895;
    fy=back[3]+210;


    if (ppx > 100) {
      float vx;
      float vy;
      vx = 6;
      vy = 0;
      ppx += -vx;
      ppy += vy;
      drawMonster(ppx, ppy + 60, 0.5);
    }
    if (ppx <= 100) {
      drawMonster(100, ppy + 60, 0.5);
    }
    if (ppx == 100) {
      fill(255);
      textSize(40);
      text("Click the fish!", 25, 50);
      text("??", 840, 175 + 60);
    }
  }


  //SCENE 10 FISH AND SEAMONSTER ARE FRIENDS

  if (scene == 10) {
    background(underwater);
    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);

    // HEARTS STUFF
    heartAnimate();
    for (int i = 0; i < heartNumber; i++) {
      drawHeart(heartLoc[i].x, heartLoc[i].y, heartScale[i], heartRotate[i], heartAlpha[i]);

      if (heartLoc[i].y < -350) {
        noStroke();
        fill(255);
        textSize(40);
        text("Click!", 25, 50);
      }
    }

    drawMonster(100, ppy + 60, 0.5);

    //FISH STUFF 
    drawFirstFish(fx, fy, -.50, radians(10), #C80000, 255, 10);
    FirstFishAnimate();
    fx=895;
    fy=back[3]+210;
  }

  //SCENE 11 END

  if (scene == 11) {
    background(underwater);

    image(heart0, random(20, 1260), random(20, 720));
    frameRate(10);

    //FISH STUFF 
    drawFirstFish(fx, fy, -2, radians(20), #C80000, 255, 10);
    FirstFishAnimate();
    fx=width/2;
    fy=height/2;

    seaweeds(0, back[0], 1, 0.03);  
    seaweeds(1000, back[1], 0.5, 0.03);
    swap = 1;
    seaweeds(0, back[2], 0.5, 0.03);
    seaweeds(375, back[3], 1.5, 0.03);
    swap = 2;
    seaweeds(800, back[4], 0.5, 0.03);
    seaweeds(500, back[5], 1, 0.03);
    swap = 0;
    seaweeds(-200, back[6], 0.5, 0.03);


    fill(255);
    textSize(100);
    text("FIN", width/2 - 50, height/2);
  }
}

// Seaweed Fucnctions

void seaweeds(int x, int y, float scaleS, float greta) {
  pushMatrix();
  scale(scaleS);
  translate(x, y);
  wave(0, 0, greta/6, greta/7, greta/4, greta/5);
  popMatrix();
}

void wave(int posX, int posY, float uheta, float aeta, float ceta, float feta) {
  fill(12, 148, 110);
  theta+=uheta;
  zeta+=aeta;
  beta+=ceta;
  eta+=feta;
  float z = zeta;
  float q = theta;
  float b = beta;
  float e = eta;
  float y;
  if (swap == 0) {
    for (int i=0; i < 25; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, 148-i*0.5, 110-i*0.5);
      y = sin(z)*50/2;
      pushMatrix();
      rotate(radians(270));
      translate((i*5)-425+posX, y+posY+400);
      ellipse(0, 0, 25, 25);
      popMatrix();
      z+=50/250f;
    }
    for (int i=0; i < 50; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(q)*50/2;
      pushMatrix();
      rotate(radians(300));
      translate((i*5)-150+posX, y+posY+580);
      ellipse(0, 0, 15, 15);
      popMatrix();
      q+=50/250f;
    }
    for (int i=0; i < 40; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(e)*50/2;
      pushMatrix();
      rotate(radians(240));
      translate((i*5)-600+posX, y+posY+175);
      ellipse(0, 0, 30, 30);
      popMatrix();
      e+=50/250f;
    }
    for (int i=0; i < 40; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(b)*50/2;
      pushMatrix();
      rotate(radians(255));
      translate((i*5)-525+posX, y+posY+330);
      ellipse(0, 0, 20, 20);
      popMatrix();
      b+=50/250f;
      fill(random(0, 40), 150-i*0.75, 110-i*0.75);
      ellipse(posX+425, posY+410, 150, 100);
    }
    fill(12, 148, 110);
    //fill(12,148,110);
    //ellipse(posX+425, posY+410, 150,100);
  } else if (swap == 1) { 
    for (int i=0; i < 35; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, 148-i*0.5, 110-i*0.5);
      y = sin(q)*50/2;
      pushMatrix();
      rotate(radians(270));
      translate((i*5)-425+posX, y+posY+400);
      ellipse(0, 0, 25, 25);
      popMatrix();
      q+=50/250f;
    }
    for (int i=0; i < 35; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(z)*50/2;
      pushMatrix();
      rotate(radians(300));
      translate((i*5)-150+posX, y+posY+580);
      ellipse(0, 0, 15, 15);
      popMatrix();
      z+=50/250f;
    }
    for (int i=0; i < 35; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(b)*50/2;
      pushMatrix();
      rotate(radians(240));
      translate((i*5)-600+posX, y+posY+175);
      ellipse(0, 0, 30, 30);
      popMatrix();
      b+=50/250f;
    }
    for (int i=0; i < 30; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(e)*50/2;
      pushMatrix();
      rotate(radians(255));
      translate((i*5)-525+posX, y+posY+330);
      ellipse(0, 0, 20, 20);
      popMatrix();
      e+=50/250f;
      fill(random(0, 40), 150-i*0.75, 110-i*0.75);
      ellipse(posX+425, posY+410, 150, 100);
    }
    fill(12, 148, 110);
    //fill(12,148,110);
    //ellipse(posX+425, posY+410, 150,100);
  } else if (swap == 2) { 
    for (int i=0; i < 30; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, 148-i*0.5, 110-i*0.5);
      y = sin(e)*50/2;
      pushMatrix();
      rotate(radians(270));
      translate((i*5)-425+posX, y+posY+400);
      ellipse(0, 0, 25, 25);
      popMatrix();
      e+=50/250f;
    }
    for (int i=0; i < 25; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(b)*50/2;
      pushMatrix();
      rotate(radians(300));
      translate((i*5)-150+posX, y+posY+580);
      ellipse(0, 0, 15, 15);
      popMatrix();
      b+=50/250f;
    }
    for (int i=0; i < 40; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(z)*50/2;
      pushMatrix();
      rotate(radians(240));
      translate((i*5)-600+posX, y+posY+175);
      ellipse(0, 0, 30, 30);
      popMatrix();
      z+=50/250f;
    }
    for (int i=0; i < 35; i++) {
      fill(random(0, 40), 150-(i*0.75), 110-(i*0.75), random(200, 255));
      //fill(random(0,40), (random(140,160)-i*0.75), (random(100,120)-i*0.75));
      //fill(12, (int)148-i*0.5, (int)110-i*0.5);
      y = sin(q)*50/2;
      pushMatrix();
      rotate(radians(255));
      translate((i*5)-525+posX, y+posY+330);
      ellipse(0, 0, 20, 20);
      popMatrix();
      q+=50/250f;
      fill(random(0, 40), 150-i*0.75, 110-i*0.75);
      ellipse(posX+425, posY+410, 150, 100);
    }
    fill(12, 148, 110);
    //fill(12,148,110);
    //ellipse(posX+425, posY+410, 150,100);
  }
}

void monsterwave(int posX, int posY) {
  fill(12, 148, 110);
  monsterzeta+=0.04;
  float z = monsterzeta;
  float y;

  for (int i=0; i < 100; i++) {
    fill(random(0, 40), (random(140, 160)-i*0.75), (random(100, 120)-i*0.75));
    fill(12, (int)100-i*0.5, (int)248-i*0.5);
    y = sin(z)*50/2;
    pushMatrix();
    translate((i*5)+250+posX, y+posY+280);
    ellipse(0, 0, 45, 45);

    //eye
    if (i > 98) {
      fill(255, 255, 0);
      translate(-470, -265);
      ellipse(475, 260, 15, 15);
      stroke(0);
      if (scene < 7) {
        line(465, 245, 485, 255);
      }
      if (scene >= 7) {
        line(465, 245, 485, 240);
      }
      //triangle(470, 250, 470, 270, 490, 260);
      noStroke();
      fill(0);
      ellipse(479, 260, 8, 10);
      if (scene == 10) {
        drawHeart(472, 257, 0.07, 0, 255);
      }



      //bottom fins
    }
    if (i > 60 && i < 62) {
      //sword
      pushMatrix();
      rotate(radians(10));
      fill(50, 50, 50);
      rect(0, 75, 50, 10);
      rect(50, 67, 10, 25);
      fill(250);
      rect(60, 70, 150, 11);
      fill(150);
      rect(60, 80, 150, 11);
      fill(255);
      triangle(210, 70, 210, 80, 220, 80);
      fill(150);
      triangle(210, 80, 210, 90, 220, 80);
      popMatrix();

      //fins
      fill(0, 100, 50);
      translate(0, 50);
      rotate(radians(30));
      translate(-400, -200);
      ellipse(400, 200, 30, 80);
      fill(0, 150, 50);
      translate(420, 180);
      rotate(radians(-10));
      translate(-400, -200);
      ellipse(400, 200, 50, 100);


      //tail
    }
    if (i > 2 && i < 4) {
      fill(0, 100, 50);
      translate(-100, -50);
      rotate(radians(30));
      translate(-200, -200);
      ellipse(200, 200, 220, 80);
      fill(0, 150, 50);
      translate(200, 240);
      rotate(radians(-20));
      translate(-200, -200);
      ellipse(200, 200, 250, 100);


      //top fins
    }
    if (i > 90 && i < 92) {
      fill (0, 150, 50);
      translate(-50, -80);
      rotate(radians(-40)); 
      translate(-200, -200);
      ellipse(200, 200, 100, 200);
    }
    if (i > 86 && i < 88) {
      fill (0, 140, 50);
      translate(-70, -70);
      rotate(radians(-40)); 
      translate(-200, -200);
      ellipse(200, 200, 80, 180);
    }
    if (i > 80 && i < 82) {
      fill (0, 130, 50);
      translate(-65, -45);
      rotate(radians(-50)); 
      translate(-200, -200);
      ellipse(200, 200, 60, 140);
    }
    if (i > 74 && i < 76) {
      fill (0, 120, 50);
      translate(-60, -30);
      rotate(radians(-60)); 
      translate(-200, -200);
      ellipse(200, 200, 40, 120);
    }
    if (i > 68 && i < 70) {
      fill (0, 110, 50);
      translate(-40, -20);
      rotate(radians(-60)); 
      translate(-200, -200);
      ellipse(200, 200, 40, 80);
    }
    if (i > 62 && i < 64) {
      fill (0, 100, 50);
      translate(-30, -20);
      rotate(radians(-70)); 
      translate(-200, -200);
      ellipse(200, 200, 30, 60);
    }

    popMatrix();
    z+=50/350f;
  }
}

void drawMonster(int x, int y, float scaleS) {
  pushMatrix();
  translate(-500, -280);
  scale(1);
  translate(x+400, y);
  monsterwave(0, 0);
  popMatrix();
}

// functions for sky
void drawSky (float skyTranslateX, float skyTranslateY, float skyScale, float skyRotate) {
  pushMatrix();
  translate(skyTranslateX, skyTranslateY);
  rotate(skyRotate);
  scale(skyScale);
  image(sky0, 0, 0);
  popMatrix();
}

void skyAnimate () {
  skyLoc.x = skyLoc.x + skyDir.x*skyTime;
  skyLoc.y = skyLoc.y + skyDir.y*skyTime;
}

// functions for hearts
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


// functions for bubbles
void drawBubbles (float bubblesTranslateX, float bubblesTranslateY, float bubblesScale, float bubblesRotate, color bubblesColor, color bubblesStrokeColor, float bubblesDiameter) {

  pushMatrix();
  translate(bubblesTranslateX, bubblesTranslateY);
  //rotate(bubblesRotate);
  scale(bubblesScale);
  stroke(bubblesStrokeColor);
  fill(bubblesColor);
  ellipse(0, 0, 10, 10);
  noStroke();
  //noFill();
  //ellipse(2, 2, random(31, 51), random(31, 51));
  popMatrix();
}

void bubblesAnimate () {
  for (int i = 0; i < bubblesNumber; i++) {
    bubblesLoc[i].x = bubblesLoc[i].x + bubblesDir[i].x*bubblesTime;
    bubblesLoc[i].y = bubblesLoc[i].y + bubblesDir[i].y*bubblesTime;
  }
}

void bubblesAnimate2 () {
  for (int i = 0; i < bubblesNumber; i++) {
    bubblesLoc[i].x = bubblesLoc[i].x + bubblesDir2[i].x*bubblesTime;
    bubblesLoc[i].y = bubblesLoc[i].y + bubblesDir2[i].y*bubblesTime;
  }
}

// functions for fish
void drawFish (float fishTranslateX, float fishTranslateY, float fishScale, float fishRotate, color fishColor, color fishEyeColor) {
  pushMatrix(); // applies to entire fish
  translate(fishTranslateX, fishTranslateY); // translate entire fish
  rotate(fishRotate); // rotate entire fish
  scale(fishScale); // scale entire fish

  // Body
  fill(fishColor);
  noStroke();
  ellipse(0, 0, 197, 69);
  triangle(-150, 0, -50, -30, -50, 30); // Left
  triangle(50, -30, 150, 0, 50, 30); // Right
  // Tail
  stroke(fishColor);
  strokeWeight(5);
  pushMatrix();
  translate(-150, 0);
  rotate(radians(fishTailMove));
  translate(150, 0);
  line(-150, 0, -187, -25); // END Top Part of Tail
  popMatrix();
  pushMatrix();
  translate(-150, 0);
  rotate(-radians(fishTailMove));
  translate(150, 0);
  stroke(fishColor);
  line(-150, 0, -187, 25);
  popMatrix(); // END Bottom Part of Tail
  // Eye
  fill(fishEyeColor);
  noStroke();
  ellipse(72, -7, 10, 10);

  popMatrix();
}

void fishAnimate() {
  // for Entire Fish
  for (int i = 0; i < fishNumber; i++) {
    fishLoc[i].x = fishLoc[i].x + fishDir[i].x*fishTime;
    fishLoc[i].y = fishLoc[i].y + fishDir[i].y*fishTime;
  }
  // for Tail
  if (fishTailMove > 35) {
    fishTailSwitch = false;
  } else if (fishTailMove < -30) {
    fishTailSwitch = true;
  }
  if (fishTailSwitch == true) {
    fishTailMove+=1;
  } else {
    fishTailMove+=-1;
  }
}

// functions for FirstFish
void drawFirstFish (float FirstFishTranslateX, float FirstFishTranslateY, float FirstFishScale, float FirstFishRotate, color FirstFishColor, color FirstFishEyeColor, float FirstFishEyeDiameter) {
  pushMatrix(); // applies to entire FirstFish

  translate(FirstFishTranslateX, FirstFishTranslateY); // translate entire FirstFish
  rotate(FirstFishRotate); // rotate entire FirstFish
  scale(FirstFishScale); // scale entire FirstFish

  // Body
  fill(FirstFishColor);
  noStroke();
  ellipse(0, 0, 197, 69);
  triangle(-150, 0, -50, -30, -50, 30); // Left
  triangle(50, -30, 150, 0, 50, 30); // Right
  // Tail
  stroke(FirstFishColor);
  strokeWeight(5);
  pushMatrix();
  translate(-150, 0);
  rotate(radians(FirstFishTailMove));
  translate(150, 0);
  line(-150, 0, -187, -25); // END Top Part of Tail
  popMatrix();
  pushMatrix();
  translate(-150, 0);
  rotate(-radians(FirstFishTailMove));
  translate(150, 0);
  stroke(FirstFishColor);
  line(-150, 0, -187, 25);
  popMatrix(); // END Bottom Part of Tail
  // Eye
  fill(FirstFishEyeColor);
  noStroke();
  ellipse(72, 10, FirstFishEyeDiameter, FirstFishEyeDiameter);

  popMatrix();
}

void FirstFishAnimate() {
  // for Entire Fish
  for (int i = 0; i < FirstFishNumber; i++) {
    FirstFishLoc[i].x = FirstFishLoc[i].x + FirstFishDir[i].x*FirstFishTime;
    FirstFishLoc[i].y = FirstFishLoc[i].y + FirstFishDir[i].y*FirstFishTime;
  }
  // for Tail
  if (FirstFishTailMove > 35) {
    FirstFishTailSwitch = false;
  } else if (FirstFishTailMove < -30) {
    FirstFishTailSwitch = true;
  }
  if (FirstFishTailSwitch == true) {
    FirstFishTailMove+=1;
  } else {
    FirstFishTailMove+=-1;
  }
}


void drawBoat() {
  noStroke();
  pushMatrix();
  translate(635, bpy);
  rotate(brotate);
  translate(-635, -295);
  fill(237, 239, 230);
  beginShape(); //whiteish boatunders
  vertex(83, 476);
  vertex(800, 500);
  vertex(1205, 541);
  vertex(1000, 600);
  vertex( 200, 600);
  endShape();
  fill(63, 23, 32);  //backof boat frame
  beginShape();
  vertex(83, 476);
  vertex(800, 500);
  vertex(1205, 541);
  vertex(1200, 556);
  vertex(805, 515);
  vertex(86, 489);
  endShape();
  //windowsglass
  fill(255, 30);
  quad(237, 420, 500, 410, 500, 510, 250, 481);
  fill(255); //white shapes of window
  rect(403, 424, 7, 129);
  rect(266, 423, 200, 7);
  beginShape();
  vertex(309, 424);
  vertex(403, 423);
  vertex(403, 436);
  vertex(358, 435);
  vertex(350, 439);
  vertex(347, 487);
  vertex(353, 490);
  vertex(403, 490);
  vertex(407, 534);
  vertex(285, 509);
  vertex(292, 485);
  vertex(321, 488);
  vertex(324, 483);
  endShape(CLOSE);
  beginShape();
  vertex(237, 410);
  vertex(266, 415);
  vertex(410, 421);
  vertex(404, 434);
  vertex(283, 429);
  vertex(285, 445);
  vertex(295, 492);
  vertex(294, 512);
  vertex(245, 510);
  vertex(250, 481);
  vertex(281, 482);
  vertex(266, 429);
  vertex(237, 420);
  endShape(CLOSE);

  //stuff to the right of door
  pushMatrix();
  translate(0, -10);
  fill(0+20);
  quad(410+142, 490, 410+142+30, 490, 410+142+40, 500, 410+142, 500); //top paralelogram
  fill(20+20);
  quad(410+142, 500, 410+142+40, 500, 410+142+38, 520, 410+142, 520);
  fill(40+20);
  quad(410+142, 520, 410+142+38, 520, 410+142+40, 545, 410+142, 545);
  fill(60+20);
  quad(410+142, 545, 410+142+36, 545, 410+142+36, 565, 410+142, 565);
  popMatrix();

  fill(119, 48, 42); //door frame
  rect(410, 422, 142, 139);
  fill(63, 23, 32); //door opening
  rect(415, 429, 132, 129, 10, 10, 0, 0);
  fill(255); //white door
  rect(480, 429, 67, 129, 0, 10, 0, 0);
  fill(119, 48, 42); //door knob
  ellipse(495, 510, 10, 12);

  //brown thing on right
  fill(0+30);
  quad(1070, 518-10, 1131, 521-10, 1100, 560, 1010, 570);
  fill(20+30);
  quad(1130, 521-10, 1200, 520-10, 1203, 541, 1100, 560);
  fill(40+30);
  quad(1070, 518-10, 1131, 515-10, 1200, 520-10, 1130, 522-10);


  drawFisher();

  fill(157, 90, 89);
  beginShape(); //boat front 3-d ishy
  vertex(83, 476);
  vertex(247, 487);
  vertex(285, 500);
  vertex(400, 520);
  vertex(415, 550);
  vertex(255, 520);
  endShape(CLOSE);

  fill(106, 174, 239);
  beginShape(); //bottom base
  vertex(95, 500);
  vertex(527, 579);
  vertex(1023, 582);
  vertex(1191, 561);
  vertex(1155, 674);
  vertex(132, 674);
  endShape(CLOSE);
  fill(119, 48, 42);
  beginShape(); //base brown frame
  vertex(83, 476);
  vertex(527, 550);
  vertex(1023, 555);
  vertex(1205, 541);
  vertex(1199, 561);
  vertex(1023, 582);
  vertex(527, 579);
  vertex(95, 500);
  vertex(87, 496);
  endShape(CLOSE);

  fill(255);
  beginShape(); //white detail of base brown frame
  vertex(95, 476+35);
  vertex(527, 550+40);
  vertex(1023, 555+40);
  vertex(1187, 541+40);
  vertex(1184, 568+20);
  vertex(1023, 582+20);
  vertex(527, 579+20);
  vertex(97, 500+20);
  //  vertex(87, 496+20);
  endShape(CLOSE);

  fill(186, 187, 203);
  beginShape(); //TOP OF DOOR  
  vertex(237, 410-3);
  vertex(510+50, 405-5);
  vertex(550+70, 423-5);
  vertex(410, 424-5);
  vertex(266, 415-3);
  endShape(CLOSE);
  fill(63, 23, 32); //TOP OF DOOR 3-D
  beginShape();
  vertex(237, 410-3);
  vertex(266, 415-3);
  vertex(410, 424-5);
  vertex(550+70, 423-5);
  vertex(550+70, 423);
  vertex(410, 424);
  vertex(266, 415);
  vertex(237, 410);
  endShape(CLOSE);

  //blacklines
  fill(100, 81, 66);
  rect(439, 200, 7, 200); //flagpole?
  // rect(420, 220, 2, 80);
  fill(106, 174, 239);
  ellipse(442, 200, 12, 12);

  beginShape();
  vertex(422+20, 220-5); 
  vertex(440+70, 220-5);
  vertex(430+70, 230-2.5);
  vertex(440+70, 240);
  vertex(422+20, 240);
  endShape(CLOSE);
  //whitetop top 3-d
  fill(255);
  rect(420, 380, 30, 30, 0, 5, 0, 0);
  triangle(400, 375, 450, 380, 420, 385);
  rect(400, 376, 10, 30);

  popMatrix();
}
void drawFisher() {
  color skintone = color(255, 221, 166);
  pushMatrix();
  translate(200, 100);
  scale(0.8);
  translate(700, 450);
  translate(-200, -100);

  fill(129, 144, 134); //body
  quad(160, 140, 240, 140, 260, 300, 140, 300);
  fill(skintone);
  ellipse(200, 100, 110, 100); //faceframe
  triangle(200, 152, 250, 135, 255, 100); //facetri>
  triangle(200, 152, 150, 135, 145, 100); //facetri<
  fill(100, 81, 66);
  ellipse(169, 100, 49, 49); //glasses<
  ellipse(231, 100, 49, 49); //glasses>
  rect(169+22, 100, 20, 7);//glasses connection
  fill(skintone);
  ellipse(169, 100, 35, 35); //glasses block
  ellipse(231, 100, 35, 35);
  fill(73, 57, 46);
  arc(170, 98, 25, 28, 0, PI); //<eyeframe toppp
  arc(230, 98, 25, 28, 0, PI);
  fill(250);
  arc(170, 100, 25, 28, 0, PI); //<eye
  arc(230, 100, 25, 28, 0, PI); //>eye
  fill(169, 140, 123);
  quad(195, 119-3, 200, 117-3, 200, 123-3, 195, 123-3); //nose<
  quad(205, 119-3, 200, 117-3, 200, 123-3, 205, 123-3); //nose>
  arc(200, 140, 36, 28, -PI, 0); //mouth
  fill(skintone);
  arc(200, 142, 36, 28, -PI, 0); //mouth cover

  fill(73, 57, 46); //eyeballs
  arc(171, 100, 16, 15, 0, PI);
  arc(229, 100, 16, 15, 0, PI);
  rect(155, 90, 27, 4);
  rect(218, 90, 27, 4);

  fill(188, 152, 146); //hatbeanie
  rect(145, 68, 110, 20, 5, 5, 0, 0);
  arc(200, 75, 100, 70, PI, TWO_PI);

  //arm
  fill(129-20, 144-20, 134-20);
  float armR =-15;
  pushMatrix();
  translate(175, 170);
  rotate(radians(armR));
  translate(-170, -170);
  ellipse(170, 170, 32, 32);
  quad(170-16, 170, 170+16, 170, 170+10, 220, 170-10, 220);
  ellipse(170, 220, 20, 20);
  popMatrix();

  pushMatrix();
  translate(225, 170);
  rotate(radians(-1*armR));
  translate(-235, -170);
  ellipse(235, 170, 32, 32);
  quad(235-16, 170, 235+16, 170, 235+10, 220, 235-10, 220);
  ellipse(235, 220, 20, 20);
  popMatrix();


  //scarf
  fill(188, 152, 146);
  rect(151, 137, 100, 17, 5, 0, 5, 0);
  beginShape();
  vertex(230, 145);
  vertex(245, 145);
  vertex(250, 200);
  vertex(235, 200);
  endShape(CLOSE);

  popMatrix();
}

void animateBoat() {
  if (brotate <= -PI/150) {
    boatD = false;
  }
  if (brotate > PI/150) {
    boatD = true;
  }
  if (boatD ==false) {
    brotate += radians(random(0.01, 0.03));
  } else {
    brotate -= radians(random(0.01, 0.03));
  }
}

void drawFatfishes() {
  for (int i=0; i<numFish; i++) {
    pushMatrix();
    scale(fishscale[i]);
    translate(ffx[i]-250, ffy[i]);
    fill(fishcolor[i]);
    ellipse(0, 0, 50, 40); //body
    triangle(-20, 0, -35, -10, -35, 10);
    fill(255);
    ellipse(10, 0, 20, 35);
    ellipse(12, 0, 25, 30);
    fill(fishcolor[i]);
    ellipse(12, -4, 6, 6);
    popMatrix();
    //fish wave
    ffx[i] += fvx[i];
    ffy[i] += 2*sin(radians(ffx[i]));
  }
}

void mousePressed() {
  if (scene==0) {
    scene=1;
    c1=true;
    println(scene);
  } else if ((scene==1) &&(c1==true)&& (mouseX>585) && (mouseX<585+225) && (mouseY>208) && (mouseY<208+59)) {
    //press 1st fish
    scene  =2;
    c1=false;
    c2=true;
    println(scene);
  } else if ((c1==false)&& (scene==2)&&(c2==true)&&(mouseX>0) && (mouseX<575) && (mouseY>182) && (mouseY<182+125) ) {
    //click seamonster (not its tail/sword)
    scene  =3;
    c3=true;
    println(scene);
  } else if ((scene==3)) {
    scene=4;
    c4=true;
    println(scene);
  } else if ((scene==4)&&(mouseX>710) && (mouseX<94+710) && (mouseY>316) && (mouseY<150+316)) {
    //press fisherman
    scene=5;
    c5=true;
    println(scene);
  } else if ((scene==5)&&(mouseX>86) && (mouseX<1113+86) && (mouseY>290) && (mouseY<290+301)) {
    //press boat
    scene=6;
    c6=true;
    println(scene);
  } else if ((scene==6) &&(mouseX>811) && (mouseX<811+212) && (mouseY>208) && (mouseY<208+213)) {
    //press net
    scene=7;
    c7=true;
    println(scene);
  } else if ((scene==7)&&(mouseX>31) && (mouseX<31+742) && (mouseY>112) && (mouseY<112+187)) {
    //press seamonster
    scene=8;
    println(scene);
  } else if ((scene==8)&&(mouseX>334) && (mouseX<334+734) && (mouseY>73) && (mouseY<73+193)) {
    //press seamonster at net
    scene=9;
    println(scene);
  } else if ((scene==9)&&(mouseX>821) && (mouseX<821+147) && (mouseY>265) && (mouseY<265+44)) {
    //press fish b4hearts
    scene=10;
    println(scene);
  } else if (( scene==10 )) {
    //press
    scene=11;
    println(scene);
  }
}

void keyPressed() {
  scene = scene + 1;
}

void net(int x, int y, float size, float netR) {
  pushMatrix();
  translate(25, 25);
  translate(x, y);
  scale(size);
  rotate(radians(netR));
  translate(-25, -25);
  noFill();
  stroke(0);
  strokeWeight(1);
  rect(0, 0, 50, 50);
  rect(10, 0, 0, 50);
  rect(20, 0, 0, 50);
  rect(30, 0, 0, 50);
  rect(40, 0, 0, 50);
  rect(0, 10, 50, 0);
  rect(0, 20, 50, 0);
  rect(0, 30, 50, 0);
  rect(0, 40, 50, 0);
  popMatrix();
}

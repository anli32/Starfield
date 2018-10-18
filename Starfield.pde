Particle [] bloodStream;
PImage bg; 
void setup() {
  size(500, 500);
  frameRate(50);
  bloodStream = new Particle[50];
  for(int i = 0; i < bloodStream.length; i++) {
    bloodStream[i] = new NormalParticle();
  }
  bloodStream[bloodStream.length - 1] = new JumboParticle();
  bloodStream[bloodStream.length - 2] = new OddballParticle();
  bg = loadImage("background.PNG");
}

void draw() {
  bloodVessel();
  
  //background(193, 59, 90);
  for(int i = 0; i < bloodStream.length; i++) {
    bloodStream[i].move();
    bloodStream[i].show();
  }  
}

void bloodVessel() {
   // Radial color gradient
  // Loop over every pixel in the window, for every pixel color it based on the pixel's distance from the center
  //for(int y = 0; y < height; y++){
  //  for(int x = 0; x < width; x++){
  //    // Get the distance between each pizel and the center of the window
  //    //    Then pass the distance into stroke() so that as the pixels get farther from the center the color changes
  //    //        This produces a radial gradient
  //    float distanceFromCenter = dist(x, y, height / 2, width / 2);
  //    stroke((distanceFromCenter / 2) + 120, distanceFromCenter / 2, distanceFromCenter / 2);
  //    point(x, y);
  //  }
  //}
  image(bg,0,0,500,500);
}

interface Particle {
  public void move();
  public void show();
}

class NormalParticle implements Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
  
  NormalParticle() {
    myX = 250;
    myY = 250;
    myAngle = Math.random() * (Math.PI * 2);
    mySpeed = (Math.random() * 2) + 1;
    myColor = color(229, 81, 101);
  }
  
  public void move() {
    myX = myX + (Math.cos(myAngle) * mySpeed);
    myY = myY + (Math.sin(myAngle) * mySpeed);
    if(myX > 500 || myX < 0 || myY > 500 || myY < 0) {
      myX = 250;
      myY = 250;
    }
  }
  
  public void show() {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, 30, 30);
    fill(10, 10, 10, 50);
    ellipse((float)myX, (float)myY, 10, 10);
    stroke(255);
  }
}

class JumboParticle extends NormalParticle{
  
  JumboParticle() {
    myX = 250;
    myY = 250;
    myAngle = Math.random() * (Math.PI * 2);
    mySpeed = (Math.random() * 2) + 1;
    myColor = color(251, 173, 255);
  }
  
  void show() {
    translate((float)myX, (float)myY);
    for(float i = 0; i < Math.PI * 1.9; i = i + (float)(Math.PI * 2 / 12)) {
      rotate(i);
      stroke(255, 255, 255, 170);
      strokeWeight(15);
      line(0, 29, 0, 31);
      rotate(-i);
    }
    translate(- (float)myX, - (float)myY);
    noStroke();
    fill(255, 255, 255, 170);
    ellipse((float)myX, (float)myY, 50, 50);
    fill(252, 191, 255, 200);
    ellipse((float)myX, (float)myY, 50, 50);
  }
}

class OddballParticle implements Particle {
  int myX, myY, myColor, myDirection;

  OddballParticle() {
    myX = 250;
    myY = 250;
    myColor = color(229, 81, 101);
    myDirection = 1;
  }
  
  void move() {
    myX= myX + myDirection;
    if(myX > 400 || myX < 50)
      myDirection = -myDirection;
  }
  
  void show() {
    noStroke();
    fill(255, 255, 255, 170);
    ellipse(myX, myY, 50, 50);
    fill(255, 208, 180, 150);
    ellipse(myX, myY, 30, 30);
  }
}
 
      
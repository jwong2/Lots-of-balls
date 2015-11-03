//declare variables
int count = 300;
float [] x = new float[count];
float [] y = new float[count];
float [] velX = new float[count];
float [] velY = new float[count];
float [] diam = new float[count];
color [] currentColor = new color[count];
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for(int i = 0; i < count; i++) {
    x[i] = width/2;
    y[i] = height/2;
    velX[i] = random(-10, 10);
    velY[i] = random(-10, 10);
    diam[i] = random(30, 80);
    currentColor[i] = color(random(0,255),random(0,255),random(0,255));
  }
}

void draw() {
  background(0);
  for(int i = 0; i < count; i++) {
    //draw background to cover previous frame
  
    fill(currentColor[i]); //fill the circle
  
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
  
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    
    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
      currentColor[i] = color(random(0,255), random(0,255), random(0,255)); //change color
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
      currentColor[i] = color(random(0,255), random(0,255), random(0,255)); //change color
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
      currentColor[i] = color(random(0,255), random(0,255), random(0,255)); //change color
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
      currentColor[i] = color(random(0,255), random(0,255), random(0,255)); //change color
    }
  }
}
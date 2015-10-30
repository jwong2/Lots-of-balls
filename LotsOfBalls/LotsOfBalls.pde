//declare variables
float x, y, velX, velY, diam;
float x2, y2, velX2, velY2;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  x2 = width/2;
  y = height/2;
  y2 = height/2;
  diam = 80;
  velX = random(-5, 5);
  velX2 = random(-5, 5);
  velY = random(-5, 5);
  velY2 = random(-5, 5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(x, y, diam, diam);
  //draw second ball
  ellipse(x2, y2, diam, diam);

  //add velocity to position
  x += velX;
  x2 +=velX2;
  y += velY;
  y2 +=velY2;

  //bounce ball if it hits walls
  if (x + diam/2 >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY);
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }


  if (x2 + diam/2 >= width) {
    velX2 = -abs(velX2);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x2 - diam/2 <= 0) {
    velX2 = abs(velX2);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y2 + diam/2 >= height) {
    velY2 = -abs(velY2);
  } else if (y - diam/2 <= 0) {
    velY2 = abs(velY2);
  }
}
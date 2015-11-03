int count = 3;
Circle[] c = new Circle[3];
int i = 0;

void setup() {
  size(300,300);
  c[0] = new Circle(10, 100, 10, 1, 1);
  c[1] = new Circle(20, 150, 100, 1, -1);
  c[2] = new Circle(10, 200, 200, 2, -2);
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  while(i < c.length) {
    c[i].update();
    i++;
  }
  i = 0;
}

class Circle {
  float radius, x, y, velx, vely;
  Circle(float r, float xpos, float ypos, float vx, float vy) {
    radius = r;
    x = xpos;
    y = ypos;
    velx = vx;
    vely = vy;
  }
  void update() {
    fill(255);
    ellipse(x, y, radius, radius);
    
    x += velx;
    y += vely;
    //bounce ball if it hits walls
    if (y + radius > height) {
      vely = -abs(vely);
    } else if (y - radius <= 0) {
      vely = abs(vely);
    }    
    
    if (x + radius > width) {
      velx = -abs(velx);
    } else if (x - radius <= 0) {
      velx = abs(velx);
    }
    
    //if bounce around other balls
    for(int j = 0; j < c.length; j++) {
      //if it isn't current circle defined by index i
      if(j != i) {
        //make sure it's not touching circle
        float distanceBetweenCenters = dist(x, y, c[j].x, c[j].y);
        if(distanceBetweenCenters < radius + c[j].radius) {
          float distanceBetweenx = dist(x, 0, c[j].x, 0);
          float distanceBetweeny = dist(0, y, 0, c[j].y);
        //see relatively if the centers want to bounce off more on the top or more on the side
          float percentTotalx = distanceBetweenx/(distanceBetweenx+distanceBetweeny);
          float percentTotaly = distanceBetweeny/(distanceBetweenx+distanceBetweeny);
          //note: this is a pseudo theory and does not reflect actual physics: in real life you would need to find the angle
          float totalVelocity = sqrt(pow(velx, 2)+pow(vely, 2)); //find the total velocity of the ball using Pythag. theorem
          velx = (velx < 0) ? totalVelocity * percentTotalx: -totalVelocity * percentTotalx; //if it's negative, set new percentage of total velocity  to positive, vice versa
          vely = (vely < 0) ? totalVelocity * percentTotaly: -totalVelocity * percentTotaly;
          float totalVelocityofOtherBall = sqrt(pow(c[j].velx, 2)+pow(c[j].vely, 2));
          println(totalVelocity);
          c[j].velx = (c[j].velx < 0) ? totalVelocityofOtherBall * percentTotalx: -totalVelocityofOtherBall *percentTotalx;
          c[j].vely = (c[j].vely < 0) ? totalVelocityofOtherBall * percentTotaly: -totalVelocityofOtherBall *percentTotaly;
      }
      }
    }
    
  }
}
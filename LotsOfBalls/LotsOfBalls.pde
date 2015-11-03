Circle[] c = new Circle[2];
int i = 0;

int count;
void setup() {
  size(500,500);
  c[0] = new Circle(10, 10, 10, 10);
  c[1] = new Circle(20, 100, 100, -10);
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
  int radius, x, y, vel;
  Circle(int r, int xpos, int ypos, int v) {
    radius = r;
    x = xpos;
    y = ypos;
    vel = v;
  }
  void update() {
    fill(255);
    ellipse(x, y, radius, radius);
    
    y += vel;
    //bounce ball if it hits walls
    if (y + radius > height) {
      count++;
      vel = -abs(vel);
      println(y);
    } else if (y - radius <= 0) {
      vel = abs(vel);
    }
    
  }
}
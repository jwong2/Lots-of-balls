Circle[] c = new Circle[2];
int i = 0;


void setup() {
  size(500,500);
  c[0] = new Circle(10, 10, 10, 10);
  c[1] = new Circle(50, 100, 100, -10);

}

void draw() {
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
    println(i);
  }
}
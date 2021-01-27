ArrayList<PVector> square = new ArrayList<PVector>();
ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> verts = new ArrayList<PVector>();
int total_vert = 40;
int total_step = 20;
boolean state = true;
void setup() {
  size(500, 500);
  for (int a = 0; a < 360; a += 360 / total_vert) {
    PVector v = PVector.fromAngle(radians(a-135));
    v.mult(100);
    circle.add(v);
  }
  for (int x = -50; x < 50; x += 100 / (total_vert / 4)) {
    PVector v = new PVector(x, -50);
    square.add(v);
  }
  for (int y = -50; y < 50; y += 100 / (total_vert / 4)) {
    PVector v = new PVector(50, y);
    square.add(v);
  }
  for (int x = 50; x > -50; x -= 100 / (total_vert / 4)) {
    PVector v = new PVector(x, 50);
    square.add(v);
  }
  for (int y = 50; y > -50; y -= 100 / (total_vert / 4)) {
    PVector v = new PVector(-50, y);
    square.add(v);
  }
  for (int i = 0; i < total_vert; i++) {
    verts.add(new PVector());
  }
}
void draw() {
  background(45);
  float dst = 0;
  for (int i = 0; i < total_vert; i++) {
    PVector t;
    if (state) {
      t = circle.get(i);
    } else {
      t = square.get(i);
    }
    PVector v = verts.get(i);
    v.lerp(t, 1.0 / total_step);
    dst += PVector.dist(t, v);
  }
  if (dst <= 0.5) {
    state = !state;
  }
  translate(width / 2, height / 2);
  strokeWeight(4);
  beginShape();
  noFill();
  stroke(255);
  for (PVector v : verts) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}

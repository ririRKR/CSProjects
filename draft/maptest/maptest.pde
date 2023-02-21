PVector p;
PVector npc;
PVector center;
ArrayList<PVector> position;
int inc;


void setup() {
  inc = 1;
  size(1440, 900);
  p= new PVector(width/2, height/2);
  npc = new PVector(width/2, height/2);
  center = new PVector(width/2, height/2);
  position = new ArrayList<PVector>();
  position.add(new PVector(p.x, p.y));
  position.add(new PVector(p.x-inc, p.y));
  position.add(new PVector(p.x-inc*2, p.y));
  position.add(new PVector(p.x-inc*3, p.y));
  position.add(new PVector(p.x-inc*4, p.y));
  position.add(new PVector(p.x-inc*5, p.y));
  position.add(new PVector(p.x-inc*6, p.y));
  position.add(new PVector(p.x-inc*7, p.y));
  position.add(new PVector(p.x-inc*8, p.y));
  position.add(new PVector(p.x-inc*9, p.y));


}

void draw(){
  
  background(0);
 // move();

  pushMatrix();
  translate(center.x-p.x, center.y-p.y);
  circle(100, 100, 200);
  square(500, 600, 200);
  movement();
  popMatrix();
}

void keyPressed(){
  move();
}
void move() {
  if (keyCode == DOWN) {
    p.y+=10;
  } else if (keyCode == UP) {
    p.y-=10;
  } else if (keyCode == LEFT) {
    p.x-=10;
  } else if (keyCode == RIGHT) {
    p.x+=10;
  }
  position.add(new PVector(p.x, p.y));

  npc.x = position.get(0).x;
  npc.y = position.get(0).y;
  if (position.size()>25) {
    position.remove(0);
  }
}


 void movement() {
    circle(p.x, p.y, 75);
    circle(npc.x, npc.y, 75);
   
  }

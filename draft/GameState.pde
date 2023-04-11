import gifAnimation.*;
class Gamestate {
  Gamestate(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn, PImage bgIn) {
    type = typeIn;
    dialogueA = dialogueAIn;
    change = changeIn;
    center = new PVector(width/2, height/2);
    p = new PVector(width/2, height/2);
    npc = new PVector(width/2, height/2);
    m = new PVector(mouseX, mouseY);
    inc = 1;
    w = 75;
    ifGoal = false;
    f = 0;
    positionDist = 75;
    sprite = still;
    p2sprite = p2still;
    
    bg = bgIn;

    
    nextP2Pos = new PVector(0, 0);
    position = new ArrayList<PVector>();
    for(int i = 0; i < positionDist; i++){
       position.add(new PVector(width/2, height/2));
    }
  }

  void display() {
    if (type.equals("dialogue")) {
      image(bg, width/2, height/2);
     // background();
      dialogue();
    } else if (type.equals("movement")) {
      movement();
      checkGoalBox();
      if (ifGoal == true) {
        goalBox();
      }
    }
  }

  void dialogue() {
    
    if(type.equals("dialogue")){
      rectMode(CENTER);
      fill(255, 50);
      rect(width/2, height*.78, width, 200);
    }
    
    textFont(pixel);
    if (dialogueA.get(dialogueNumber).getName().equals("")) { //computer
      fill(#B4DDFF);
    } else {
      fill(0);
    }
    rectMode(CORNER);
    textLeading(75);
    text(dialogueA.get(dialogueNumber).getSpeech(), width/12, height*.80, width*.90, height*.97);
    text(dialogueA.get(dialogueNumber).getName(), width/12, height*.75);
    rectMode(CENTER);
   
  }

  void goalBox() {
    rectMode(CORNER);
    textFont(smallPixel);
    fill(#F7DC41);
    text("NEW TASK:", width*.80, height*0.04);
    fill(0);
    text(goal, width*.80, height*0.05, width*.2, height*0.08);
    rectMode(CENTER);
  }


  void movement() {
    
    fill(0);
    pushMatrix();
    
    m.x = mouseX - (center.x-p.x);
    m.y = mouseY - (center.y-p.y);
    translate(center.x-p.x, center.y-p.y); 
    image(grassTest, width/2, height/2);
    totalObjDAC();
    
    if(p.y<npc.y){
      image(sprite, p.x, p.y, width*100/1440, height*200/900);
      sprite.loop();
      image(p2sprite, npc.x, npc.y, width*100/1440, height*200/900);
      p2sprite.loop();
    } else if(p.y>npc.y || p.y == npc.y){
      image(p2sprite, npc.x, npc.y, width*100/1440, height*200/900);
      p2sprite.loop();
      image(sprite, p.x, p.y, width*100/1440, height*200/900);
      sprite.loop();
    }
    
    //println("npc.y: " + npc.y);
    //println("p.y: " + p.y);
    
    circle(100, 100, 200);
    square(500, 600, 200);
    popMatrix();
    
    
    fill(50);
   // text("mouseXY: " + mouseX + " " + mouseY, width/2, height/2);
    //text("t mouse: " + m.x + " " + m.y, width/2, height*2/3);

    if (!dialogueA.get(dialogueNumber).getSpeech().equals("")) { //if there is something to say
      dialogue();
    }
  }
  
  String objectInteraction (String objName, PVector objPos, int objW, int objH){
    if(m.x>objPos.x-(objW/2) && m.x<objPos.x+(objW/2) && m.y > objPos.y-(objH/2) && m.y<objPos.y+(objH/2)){
      return objName;
    }
    return "empty";
  }

  void totalObjDAC(){
    
    
  }
  
  void m() {
    //circle(p.x, p.y, w);
    nextP2Pos = position.get(1);

    if(npc.x<nextP2Pos.x){ //if the npc is to the left of the next x position
      p2sprite = p2rwalking; //move right
    } else if(npc.x>nextP2Pos.x){
      p2sprite = p2lwalking;
    } else if(npc.x<nextP2Pos.x){
      p2sprite = p2lwalking;
    } else if(npc.y>nextP2Pos.y){
      p2sprite = p2bwalking;
    } else if(npc.y<nextP2Pos.y){
      p2sprite = p2fwalking;
    } else if(npc.x == nextP2Pos.x && npc.y == nextP2Pos.y){
      p2sprite = p2still;
    } else {
      p2sprite = p2still;
    }
    
    if(position.size()<positionDist){
      p2sprite = p2still;
    }
    
  }

  void move() {
    if (keyCode == DOWN && p.y+w < height) {
      p.y+=3;
      sprite = fwalking;
    } else if (keyCode == UP && p.y-w > 0) {
      p.y-=3;
      sprite = bwalking;
    } else if (keyCode == LEFT && p.x-w > 0) {
      p.x-=3;
      sprite = lwalking;
    } else if (keyCode == RIGHT && p.x+w < width) {
      p.x+=3;
      sprite = rwalking;
    } else {
      sprite = still;
      p2sprite = p2still;
    }
    
    m();
    
    position.add(new PVector(p.x, p.y));

    npc.x = position.get(0).x;
    npc.y = position.get(0).y;
    if (position.size()>positionDist) {
      position.remove(0);
    }
  }

  void phone() {
  }

  int getDialogueNumber() {
    return dialogueNumber;
  }

  int getChange() {
    return change;
  }

  void checkGoalBox() {
    
  }

  void gsKP() {
  }

  boolean gsInc() {
    if (dialogueNumber > change-1) {
      return true;
    } else return false;
  }

  void mouseInteraction() {
  }

  void keyInteraction() {
  }


  PVector getP() {
    return p;
  }


  private String type;
  protected ArrayList<Dialogue> dialogueA;
  protected int dialogueNumber;
  private int change;
  private PVector p;
  private PVector npc;
  private ArrayList<PVector> position;
  private PVector nextP2Pos;
  protected boolean ifGoal;
  protected String goal;
  protected PVector m;
  protected int f;
  protected int positionDist;
  
  protected Gif sprite;
  protected Gif p2sprite;
  
  protected PImage bg;

 

  private PVector center;
  private int inc;
  private int w;
}

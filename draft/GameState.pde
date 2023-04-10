import gifAnimation.*;
class Gamestate {
  Gamestate(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn) {
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
    sprite = still;
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

  void display() {
    if (type.equals("dialogue")) {
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
     background(255);
    textFont(pixel);
    if (dialogueA.get(dialogueNumber).getName().equals("")) { //computer
      fill(#B4DDFF);
    } else {
      fill(0);
    }
    rectMode(CORNER);
    textLeading(75);
    text(dialogueA.get(dialogueNumber).getSpeech(), width/12, height*.70, width*.90, height*.97);
    text(dialogueA.get(dialogueNumber).getName(), width/12, height*.65);
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
    m();
    image(sprite, p.x, p.y, width*100/1440, height*200/900);
    sprite.loop();
    
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
    circle(npc.x, npc.y, w);
  }

  void move() {
    if (keyCode == DOWN && p.y+w < height) {
      p.y+=5;
      sprite = fwalking;
    } else if (keyCode == UP && p.y-w > 0) {
      p.y-=5;
      sprite = bwalking;
    } else if (keyCode == LEFT && p.x-w > 0) {
      p.x-=5;
      sprite = lwalking;
    } else if (keyCode == RIGHT && p.x+w < width) {
      p.x+=5;
      sprite = rwalking;
    } else {
      sprite = still;
    }
    
    position.add(new PVector(p.x, p.y));

    npc.x = position.get(0).x;
    npc.y = position.get(0).y;
    if (position.size()>25) {
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
  protected boolean ifGoal;
  protected String goal;
  protected PVector m;
  protected int f;
  
  protected Gif sprite;

 

  private PVector center;
  private int inc;
  private int w;
}

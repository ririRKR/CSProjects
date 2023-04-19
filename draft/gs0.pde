class gs0 extends Gamestate{
  
  gs0(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn, PImage bgIn, ArrayList<PImage> mapIn, ArrayList<Obj> objsIn, PVector startPosIn, PVector restrictionInX, PVector restrictionInY){
    super(typeIn, dialogueAIn, changeIn, bgIn, mapIn, objsIn, startPosIn, restrictionInX, restrictionInY);
    phonegs0 = loadImage("phonegs0.png");
    phonegs0.resize(width/int(2.5), height/int(2.5));
  }

  void phone(){
    background(0);
    fill(#B4DDFF);
    rectMode(CORNER);
    textLeading(75);
    text("Click the message app to call the tow truck.", width/12, height*.75, width*.90, height*.97);
    image(phonegs0, width/2, height/2);
    rectMode(CENTER);
    //background(255, 0, 0);
  }
  
  void mouseInteraction(){
    println("mx: " + mouseX + " my: " + mouseY);
    println(width/2-width/int(2.5));
    if(dialogueNumber!=10 && dialogueNumber != 11){
       dialogueNumber++;
    } else if(dialogueNumber==11){ 
      if(mouseX>width*.40 && mouseX<width*.60 && mouseY>height*.4 && mouseY<height*.6){
        dialogueNumber++;
      } else println("not in zone");
    } else if(dialogueNumber==10){
      println("PHONE");
    }
  }
  
  void keyInteraction(){
   /*if(dialogueNumber!=10){
       dialogueNumber++;
    } else println("not going to phone");
    */
    
    if(dialogueNumber==10 && keyCode == TAB){
      dialogueNumber++;
    }
  }
  
  private PImage phonegs0;
 
}

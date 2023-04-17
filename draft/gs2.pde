class gs2 extends Gamestate{
  
  gs2(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn, PImage bgIn, ArrayList<PImage> mapIn, PVector startPosIn, PVector restrictionInX, PVector restrictionInY){
    super(typeIn, dialogueAIn, changeIn, bgIn, mapIn, startPosIn, restrictionInX, restrictionInY);
  }

  void phone(){
    background(255, 0, 0);
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
    
  }
  
 
}

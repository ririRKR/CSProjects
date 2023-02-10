class gs1 extends Gamestate{
  
  gs1(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn){
    super(typeIn, dialogueAIn, changeIn);
  }
  
  void phone(){
    background(255, 0, 0);
  }
  
  void gsKP(){
    if(dialogueNumber!=10){
       dialogueNumber++;
    } else println("phone");
  }
  
  void mouseInteraction(){
    if(dialogueNumber==11 && mouseX<250){
       dialogueNumber++;
    } else println("not in zone");
  }
  
  void keyInteraction(){
   if(dialogueNumber==10){
       dialogueNumber++;
    } else println("not going to phone");
  }
}

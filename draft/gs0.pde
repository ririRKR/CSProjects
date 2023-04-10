class gs0 extends Gamestate{
  
  gs0(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn){
    super(typeIn, dialogueAIn, changeIn);
  }

  void phone(){
    background(255, 0, 0);
  }
  
  void gsKP(){
    if(dialogueNumber!=10 && dialogueNumber != 11){
       dialogueNumber++;
    } else if(dialogueNumber==11){
      mouseInteraction();
    } else if(dialogueNumber==10){
      println("PHONE");
    }
  }
  
  void mouseInteraction(){
    if(mouseX<250){
       dialogueNumber++;
    } else println("not in zone");
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
 
}

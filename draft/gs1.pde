class gs1 extends Gamestate{
  
  gs1(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn){
    super(typeIn, dialogueAIn, changeIn);
    t = 0;
    goal = "Find the sign p2 was talking about";
  }
  
  void phone(){
    background(255, 0, 0);
  }
  
  void gsKP(){
    /*
    if(dialogueNumber!=10){
       dialogueNumber++;
    } else println("phone");
    */
  }
  
  void mouseInteraction(){
    /*
    if(dialogueNumber==1 && mouseX<250){
       dialogueNumber++;
    } else println("not in zone");
    */
  }
  
  void keyInteraction(){
       // println("dialogue");
    if(dialogueNumber == 0){
      if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT){
        t++;
        if(t>=10){
          dialogueNumber++;
        }
      }
    } else if(dialogueNumber == 1){
      if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT){
        t++;
      }
      if(t>=30){
        dialogueNumber++;
      } 
    }
    /*
   if(dialogueNumber==10){
       dialogueNumber++;
    } else println("not going to phone");
  }*/
}
    
  private int t;
}

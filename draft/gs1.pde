class gs1 extends Gamestate {

  gs1(String typeIn, ArrayList<Dialogue> dialogueAIn, int changeIn, PImage bgIn, ArrayList<PImage> mapIn, ArrayList<Obj> objsIn, PVector startPosIn, PVector restrictionInX, PVector restrictionInY) {
    super(typeIn, dialogueAIn, changeIn, bgIn, mapIn, objsIn, startPosIn, restrictionInX, restrictionInY);
    t = 0;
    goal = "Find the sign B was talking about";
  }

  void phone() {
    background(255, 0, 0);
  }

  void gsKP() {
    /*
    if(dialogueNumber!=10){
     dialogueNumber++;
     } else println("phone");
     */
  }

  void mouseInteraction() {
    if (dialogueNumber == 2) {
      if (objInteraction(objs.get(4)).equals("car")) {
        dialogueNumber = 3;
      } else if(objInteraction(objs.get(2)).equals("sign")){
        dialogueNumber = 4; //background(0);
      }
      
      /*
      println(objs.get(0).getObjName());
      println(objs.get(1).getObjName());
      println(objs.get(2).getObjName());
      println(objs.get(3).getObjName());
      println(objs.get(4).getObjName());
      */
      //println(objInteraction(objs.get(3)).equals("sign"));
      
    }

    //if(mouseX<250){
    // text("HI!", width/2, height/2);
    //} else println("not in zone");
  }

  void keyInteraction() {
    // println("dialogue");
    if (dialogueNumber == 0) {
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        t++;
        if (t>=10) {
          dialogueNumber++;
          t = 0;
        }
      }
    } else if (dialogueNumber == 1) {
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        t++;
      }
      if (t>=20) {
        dialogueNumber++;
        t = 0;
      }
    } else if (dialogueNumber == 3) {
        if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
          t++;
          if (t>=10) {
            dialogueNumber = 2;
            t = 0;
          }

          /*
   if(dialogueNumber==10){
           dialogueNumber++;
           } else println("not going to phone");
           }*/
        }
      }
    }
  

  void checkGoalBox() {
    if (dialogueNumber>=2) {
      ifGoal = true;
    }
  }


  private int t;

}

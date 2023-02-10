import java.util.*;

PFont pixel;
ArrayList<Gamestate> gamestates;
ArrayList<Dialogue> DG0;
ArrayList<Dialogue> DG1;
Gamestate currentGS;
int cGSN;
String mc;
String p2;
String computer;

String dg0file;

void setup() {
  size(1440, 900);
  //fullScreen();
  background(255);
  textAlign(LEFT);
  rectMode(CENTER);
  noStroke();
  mc = "A";
  p2 = "B";
  computer = "";
  pixel = createFont("dogica.ttf", 30);
  cGSN = 0;
  
  dg0file = "Dgs0.txt";
  
  ArrayList<Dialogue> DG0 = new ArrayList<Dialogue>();
  DG0 = loadDialogue(dg0file);
  // DG0.add(new Dialogue("", ""));


  DG1 = new ArrayList<Dialogue>();
  DG1.add(new Dialogue(mc, "Hi3!"));
  DG1.add(new Dialogue(p2, "H24!"));


  gamestates = new ArrayList<Gamestate>();
  Gamestate gs0 = new gs0("dialogue", DG0, 13);
  Gamestate gs1 = new Gamestate("dialogue", DG1, 2);
  gamestates.add(gs0);
  gamestates.add(gs1);


}

void draw() {
  background(255);

  Gamestate currentGS = gamestates.get(cGSN);
  println(currentGS.getDialogueNumber());

  if (cGSN == 0 && currentGS.getDialogueNumber() == 11) {
    currentGS.phone();
  } else {
    currentGS.display();
  }

  if (currentGS.getDialogueNumber() == currentGS.getChange()) {
    cGSN++;
  }
}

void mouseClicked() {
  gamestates.get(cGSN).gsKP();
  if (gamestates.get(cGSN).gsInc() == true) {
    cGSN++;
  }

  //gamestates.get(cGSN).mouseInteraction();

  /*
  if(gamestates.get(currentGS).getMenu() == false){ //if it's not in the menu
   gamestates.get(currentGS).gsKP();
   } else if (gamestates.get(currentGS).getMenu() == true && gamestates.get(currentGS).getMenuDone() == true){
   //gamestates.get(currentGS).leaveMenu();
   gamestates.get(currentGS).gsKP();
   }
   */
}

void keyPressed() {
  println(currentGS);
  if (keyCode == DOWN || keyCode == UP || keyCode == LEFT || keyCode == RIGHT) {
    currentGS.move();
  }
  gamestates.get(cGSN).keyInteraction();
  /*else if(keyCode == TAB){
   if(currentGS == 1){
   // println("hi");
   gamestates.get(currentGS).toMenu();
   } else {
   gamestates.get(currentGS).changeMenu();
   }
   */
}

ArrayList<Dialogue> loadDialogue(String filename) {
  String[] upload = loadStrings(filename);
  ArrayList<Dialogue> DArrayList = new ArrayList<Dialogue>();
  
  for (String s : upload) {
    String[] both = s.split("=");
    if (both.length!=2) {
      System.out.println("Length is not 2");
    }
   
    String uploadSpeaker = both[0];
    String name = "";
    String speech = both[1];
    
    if (uploadSpeaker.equals("mc")) {
      name = "A";
    } else if (uploadSpeaker.equals("p2")){
      name = "B";
    } else if(uploadSpeaker.equals("com")){
      name = "";
    }
    
    Dialogue d = new Dialogue(name, speech);
    DArrayList.add(d);

  }
    return DArrayList;
}
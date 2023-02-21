import java.util.*;

PFont pixel; PFont smallPixel;
ArrayList<Gamestate> gamestates;
ArrayList<Dialogue> DG0;
ArrayList<Dialogue> DG1;
Gamestate currentGS;
int cGSN;
String mc;
String p2;
String computer;

String dg0file; String dg1file;

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
  smallPixel = createFont("dogica.ttf", 15);
  cGSN = 1;
  
  dg0file = "Dgs0.txt";
  dg1file = "Dgs1.txt";
  
  ArrayList<Dialogue> DG0 = new ArrayList<Dialogue>();
  DG0 = loadDialogue(dg0file);
  // DG0.add(new Dialogue("", ""));


  ArrayList<Dialogue> DG1 = new ArrayList<Dialogue>();
  DG1 = loadDialogue(dg1file);


  gamestates = new ArrayList<Gamestate>();
  Gamestate gs0 = new gs0("dialogue", DG0, 18);
  Gamestate gs1 = new gs1("movement", DG1, 4);
  gamestates.add(gs0);
  gamestates.add(gs1);


}

void draw() {
  background(255);

  Gamestate currentGS = gamestates.get(cGSN);
  //println(currentGS.getDialogueNumber() + " " + cGSN);
  //println(currentGS.getP());

  if (cGSN == 0 && currentGS.getDialogueNumber() == 11) {
    currentGS.phone();
  } else {
    currentGS.display();
  }

  if (currentGS.getDialogueNumber() == currentGS.getChange()) {
    cGSN++;
  }
}

void mousePressed() {
  gamestates.get(cGSN).gsKP();
  if (gamestates.get(cGSN).gsInc() == true) {
    cGSN++;
  }

  gamestates.get(cGSN).mouseInteraction();

}

void keyPressed() {
  //println(currentGS);
  if (keyCode == DOWN || keyCode == UP || keyCode == LEFT || keyCode == RIGHT) {
    gamestates.get(cGSN).move();
  }
  gamestates.get(cGSN).keyInteraction();
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

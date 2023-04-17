import gifAnimation.*;
import java.util.*;

PFont pixel; PFont smallPixel;
public PImage grassTest; public PImage bgGS0;
public PImage tree;
ArrayList<Gamestate> gamestates;
ArrayList<Dialogue> DG0, DG1, DG2;
ArrayList<PImage> MG1;
Gamestate currentGS;
int cGSN;
String mc;
String p2;
String computer;
public Gif fwalking, still, bwalking, rwalking, lwalking;
public Gif p2fwalking, p2still, p2bwalking, p2rwalking, p2lwalking;

String dg0file, dg1file, dg2file;

void setup() {
  
  fullScreen();
  //size(1440, 900);
  //fullScreen();
  background(255);
  textAlign(LEFT);
  rectMode(CENTER);
  noStroke();
  mc = "A";
  p2 = "B";
  computer = "";
  pixel = createFont("dogica.ttf", 28);
  smallPixel = createFont("dogica.ttf", 15);
  cGSN = 1;
 
  fwalking = new Gif(this, "walking.gif");
  still = new Gif(this, "still.gif");
  bwalking = new Gif(this, "bwalking.gif");
  rwalking = new Gif(this, "rwalking.gif");
  lwalking = new Gif(this, "lwalking.gif");
  
  p2fwalking = new Gif(this, "p2walking.gif");
  p2still = new Gif(this, "p2still.gif");
  p2bwalking = new Gif(this, "p2bwalking.gif");
  p2rwalking = new Gif(this, "p2rwalking.gif");
  p2lwalking = new Gif(this, "p2lwalking.gif");
  
  grassTest = loadImage("grasstest.png");
  grassTest.resize(width, height);
  bgGS0 = loadImage("2bgGS0.jpg");
  bgGS0.resize(width+width*6/1440, height);
  tree = loadImage("TREE.png");
  tree.resize(width*285/1440, height*407/900);

 
  dg0file = "Dgs0.txt";
  dg1file = "Dgs1.txt";
  dg2file = "Dgs2.txt";
  
  ArrayList<Dialogue> DG0 = new ArrayList<Dialogue>();
  DG0 = loadDialogue(dg0file);

  ArrayList<Dialogue> DG1 = new ArrayList<Dialogue>();
  DG1 = loadDialogue(dg1file);
  
  ArrayList<Dialogue> DG2 = new ArrayList<Dialogue>();
  DG2 = loadDialogue(dg2file);
  
  ArrayList<PImage> MG1 = new ArrayList<PImage>();
  for(int i = 0; i<=8; i++){
    MG1.add(bgGS0);
  }

  gamestates = new ArrayList<Gamestate>();
  Gamestate gs0 = new gs0("dialogue", DG0, 18, bgGS0, null, null, null, null);
  Gamestate gs1 = new gs1("movement", DG1, 4, null, MG1, new PVector(width/2, height*1.45), new PVector(0, width), new PVector(0, height*1.5));
  Gamestate gs2 = new gs2("dialogue", DG2, 5, bgGS0, null, null, null, null);
  gamestates.add(gs0);
  gamestates.add(gs1);
  gamestates.add(gs2);

  imageMode(CENTER);

}

void draw() { 
  Gamestate currentGS = gamestates.get(cGSN);
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
  gamestates.get(cGSN).mouseInteraction();
}

void keyPressed() {
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

void keyReleased(){
  gamestates.get(cGSN).sprite = still;
  gamestates.get(cGSN).p2sprite = p2still;
}

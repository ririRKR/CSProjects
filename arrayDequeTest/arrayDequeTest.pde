import java.util.*;
ArrayDeque<String> qd;
ArrayDeque<String> qd2;
ArrayList<Integer> a;

void setup(){
  qd = new ArrayDeque<>();
  qd.push("a");
  qd.push("b");
  qd.push("c");
  qd.push("d");
  qd.pop();
  println("push: " + qd);
  a = new ArrayList<Integer>();
  a.add(0); a.add(1); a.add(2); a.add(3); a.add(4);
  
  
  qd2 = new ArrayDeque<>();
  qd2.offer("a");
  qd2.offer("b");
  qd2.offer("c");
  qd2.offer("d");
  qd2.pop();
  println("offer: " + qd2);
  
  

}

void draw(){
  println(a);
 if(a.size()>5){
      println("HIHIHIHI");
      a.remove(0);
 }
}

void keyPressed(){
  a.add(7);
}

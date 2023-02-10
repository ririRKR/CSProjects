class Dialogue{
  
  Dialogue(String nameIn, String speechIn){
    name = nameIn;
    speech = speechIn;
  }

  String getName(){
    return name;
  }
  
  String getSpeech(){
    return speech;
  }
  
  String name;
  String speech;
}

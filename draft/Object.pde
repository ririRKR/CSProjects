class Obj{  
  Obj(String objNameIn, PImage objImgIn, PVector objPosIn){
    objName = objNameIn; objImg = objImgIn; objPos = objPosIn;
  }
  
  void objDisplay(){
    image(objImg, objPos.x, objPos.y);
  }
  
  
  
  protected String objName;
  protected PImage objImg;
  public PVector objPos;
  
  public float bottomOf;
  
}

class Obj{  
  Obj(String objNameIn, PImage objImgIn, PVector objPosIn){
    objName = objNameIn; objImg = objImgIn; objPos = objPosIn;
    dim = new PVector();
  }
  
  void objDisplay(){
    image(objImg, objPos.x, objPos.y);
  }
  
  String getObjName(){
    return objName;
  }
  
  
  protected String objName;
  protected PImage objImg;
  public PVector objPos;
  public PVector dim;
  
  public float bottomOf;
  
}

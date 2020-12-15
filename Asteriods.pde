class Asteriod extends Floater{
  private double rotationSpeed;
  private double killDistance = 20;
  
  public Asteriod(){
       corners = 4;   
       xCorners = new int[]{16, -16, -16, 16};   
       yCorners = new int[]{16 , 16, -16 , -16};     
       myColor = color(255);   
       myCenterX = Math.random()*1000; 
       myCenterY = Math.random()*1000; //holds center coordinates   
       myXspeed = Math.random() * 10.0 - 5;
       myYspeed = Math.random() * 10.0 - 5;
       myPointDirection = Math.random() * 360.0; 
       rotationSpeed = Math.random() * 10.0 - 5;
  }
  public void move(){
    super.move();
    myPointDirection += rotationSpeed;    
  }
  public boolean dieQuestionMark(double dieX, double dieY){
    return dist((float)dieX, (float)dieY, (float)myCenterX, (float)myCenterY) < killDistance;
  }
  public void show(){
    noFill();
    super.show();
  }
}

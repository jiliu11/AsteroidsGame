class Asteriod extends Floater{
  private double rotationSpeed;
  private double killDistance = 25;
  
  public Asteriod(){
       corners = 4;   
       xCorners = new int[]{25, -25, -25, 25};   
       yCorners = new int[]{25 , 25, -25 , -25};     
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
  public boolean tooClose(double dieX, double dieY){
    return dist((float)dieX, (float)dieY, (float)myCenterX, (float)myCenterY) < killDistance;
  }
  public void show(){
    fill(0); 
    stroke(myColor);
    strokeWeight(2);
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    
  }
}

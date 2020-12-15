class Spaceship extends Floater  
{   
  private double speedLimit = 20;  
  public Spaceship(){
       corners = 4;   
       xCorners = new int[]{20, -10, -5, -10};   
       yCorners = new int[]{0 , 10, 0 ,-10};     
       myColor = color(255);   
       myCenterX = 500; 
       myCenterY = 500; //holds center coordinates   
       myXspeed = 0;
       myYspeed = 0;
       myPointDirection = 0; 
    }
    public void hyperspace(){
      myCenterX = Math.random() * 1000;
      myCenterY = Math.random() * 1000;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random() * 360;
    }
    
    public double getX(){
      return myCenterX;
    }
    public double getY(){
      return myCenterY;
    }
    
    public boolean didIHitSpeedLimit(){
      return dist(0,0, (float)myXspeed, (float)myYspeed) > speedLimit;
        
    }
    
      
}

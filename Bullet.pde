class Bullet extends Floater 
{     
  private int height = 2;
  private int width = 14;
  private double myRange;
  private double startingX, startingY;
  public Bullet(double shipX, double shipY, double direction, double range){
       corners = 4;   
       xCorners = new int[]{width/2, -width/2, -width/2, width/2};   
       yCorners = new int[]{height/2 , height/2, -height/2, -height/2};     
       myColor = color(255,255,255);   
       myCenterX = shipX; 
       myCenterY = shipY;
       startingX = shipX;
       startingY = shipY;
       myXspeed = 0;
       myYspeed = 0;
       myPointDirection = direction; 
       accelerate(20);
       myRange = range;
    }  
  public double getX(){  
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public boolean outOfBounds(){
    return (myCenterX > 1100 || myCenterX < -100 || myCenterY > 1000|| myCenterY < -100) || (dist((float)myCenterX, (float)myCenterY, (float)startingX, (float)startingY) > myRange);
      
  }
  
  public void move(){
    myCenterX += myXspeed;    
    myCenterY += myYspeed;      
  }
}

class Spaceship extends Floater  
{   
    Spaceship(){
       corners = 4;   
       xCorners = new int[]{16, -8, -4, -8};   
       yCorners = new int[]{0 , 8, 0 ,-8};     
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
    
      
}

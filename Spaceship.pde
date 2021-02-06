class Spaceship extends Floater  
{ 
  private double speedLimit = 10;  
  private int hp;
  private int shootType;
  private int fireCoolDown;
  private int lastFireCd;
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
       hp = 100;
       shootType = 0;
       fireCoolDown = 0;
       lastFireCd = 20;
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
    public double getDirection(){
      return myPointDirection;
    }
    
    public void move(){
      super.move();
      double speed = dist(0,0, (float)myXspeed, (float)myYspeed);
      if(speed > speedLimit){
        double decreaseRatio = speedLimit/speed;
        myXspeed *= decreaseRatio;
        myYspeed *= decreaseRatio;
        //println(dist(0,0, (float)myXspeed, (float)myYspeed));
      }
      if(fireCoolDown != 0  && hp > 0)
        fireCoolDown --;
        
    }
    public void loseHp(int hpLoseAmount){
      hp -= hpLoseAmount;
    }
    public void changeShoot(){
      shootType ++;
      shootType = shootType%2;
    }
    public void fire(ArrayList<Bullet> bulletArray){
      if(fireCoolDown != 0)
        return;
      if(shootType == 0){
        bulletArray.add(new Bullet(bobship.getX(), bobship.getY(), bobship.getDirection(), 1000));
        fireCoolDown = 20;
        
      }
      else if(shootType == 1){
      for(int i = -15; i <=15; i +=5)
          bulletArray.add(new Bullet(bobship.getX(), bobship.getY(), bobship.getDirection() + i, 300));
      fireCoolDown = 30;
      }
      lastFireCd = fireCoolDown;
    }
    public void drawHp(){
      rectMode(CORNERS);
      noStroke();
      fill(80,80,80);
      rect(10, 690, 70, 890, 10);
      
      fill(255, 0, 0);
      if(hp > 0)
        rect(15, 885, 65, (885 - (885-695)*hp*0.01));
      rectMode(CORNER);
    }
    public void drawShootIcon(){
      rectMode(CORNERS);
      noStroke();
      fill(75,75,75);
      rect(80, 890, 140, 830);
      
      fill(200,200,200);
      rect(85, 835 + 50 * ((float)fireCoolDown/(float)lastFireCd), 135, 885, 10);
      
      if(shootType == 0){
        fill(130); 
        ellipse(110, 860, 20, 20);
      }
       else if(shootType == 1){
        fill(130);
        translate(110, 860);
        for(int i = 0; i < 8; i ++){
          ellipse(15, 0, 9, 9);
          rotate((float)45*(float)Math.PI/180);
        }
        ellipse(0,0,13,13);
        translate(-110, -860);
      }
      

     }
     public boolean checkDie(){
       if( 5 == 5){
          hp -= 50;
          speedLimit = 0;
          fireCoolDown = 01;
          myColor = color(0);
          return true;
       }     
      return false;
      
    }
    
      
}

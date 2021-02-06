//your variable declarations here
Spaceship bobship;
ArrayList<Asteriod> bobrock;
Star[] stars = new Star[300]; 
ArrayList<Bullet> pews;
boolean shipDead = false;

ArrayList<Explosion> dieShip;

boolean wPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;
public void setup() 
{
  size(1000, 900);
  frameRate(60);
  
  dieShip = new ArrayList<Explosion>();
  
  pews = new ArrayList<Bullet>();

  
  bobrock = new ArrayList<Asteriod>();
  for(int i = 0; i < 30; i++)
    bobrock.add(new Asteriod()); 
  
  bobship = new Spaceship();
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
  
  
}
public void draw() 
{ 
  background(0);
  for(int i = 0; i < stars.length; i++)
    stars[i].show();

  bobship.show();
  bobship.move();

  for(int i = 0; i < pews.size(); i++){
    pews.get(i).move();
    pews.get(i).show();
    if(pews.get(i).outOfBounds()){
      pews.remove(i);
      if(i != 0)
        i--;
    }
      
  }  
  for(int i = 0; i < bobrock.size(); i++){
    bobrock.get(i).move();
    bobrock.get(i).show();
    if(bobrock.get(i).tooClose(bobship.getX(), bobship.getY())){
      bobrock.remove(i);
      bobship.loseHp(15);
if(i != 0)
        i--;
    }
    for(int a = 0; a < pews.size(); a++){
      if(bobrock.get(i).tooClose(pews.get(a).getX(), pews.get(a).getY())){
        bobrock.remove(i);
         if(i != 0)
           i--;
         pews.remove(a);
         if(a != 0)  
           a--;
         break; 
         
      }
    
    }
     
  }
 if(bobship.checkDie()){
    dieShip.add(new Explosion(255,20, bobship.getX(), bobship.getY()));
    bobship.loseHp(-100);
  }
  
  for(int i = 0; i < dieShip.size(); i ++){
    dieShip.get(i).explode();
  }

  
  bobship.drawHp();
  bobship.drawShootIcon();
  
  if(wPressed)
    bobship.accelerate(0.5);
  if(aPressed)
    bobship.turn(-3);
  if(dPressed)
    bobship.turn(3);
  if(spacePressed)
    bobship.fire(pews);
}
public void keyPressed(){
  if((key == 'W' || key == 'w')){
    wPressed = true;
  }
  if(key == 'A' || key == 'a'){
    aPressed = true;
  }
  if(key == 'D' || key == 'd'){
    dPressed = true;
  }
  if(key == 'H' || key == 'h'){
    bobship.hyperspace();
  }
  if(key == 32){
    spacePressed = true;
      
  }
}
public void keyReleased(){
  if((key == 'W' || key == 'w')){
    wPressed = false;
  }
  if(key == 'A' || key == 'a'){
    aPressed = false;
  }
  if(key == 'D' || key == 'd'){
    dPressed = false;
  }
  if(key == 'Q' || key == 'q'){
    bobship.changeShoot();
  }
  if(key == 32)
    spacePressed = false;
  
}
  

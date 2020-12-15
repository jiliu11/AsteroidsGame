//your variable declarations here
Spaceship bobship;
ArrayList<Asteriod> bobrock;
Star[] stars = new Star[300]; 
public void setup() 
{
  size(1000, 1000);
  frameRate(60);
  
  bobrock = new ArrayList<Asteriod>();
  for(int i = 0; i < 20; i++)
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
  
  for(int i = 0; i < bobrock.size(); i++){
    bobrock.get(i).move();
    bobrock.get(i).show();
    if(bobrock.get(i).dieQuestionMark(bobship.getX(), bobship.getY())){
      bobrock.remove(i);
      i--;
    }
    
      
  }
  
}
public void keyPressed(){
  if((key == 'W' || key == 'w') && !bobship.didIHitSpeedLimit()){
    bobship.accelerate(0.5);
  }
  if(key == 'A' || key == 'a'){
    bobship.turn(-3);
  }
  if(key == 'D' || key == 'd'){
    bobship.turn(3);
  }
  if(key == 'H' || key == 'h'){
    bobship.hyperspace();
  }
  
}

//your variable declarations here
Spaceship bobship;
Star[] stars = new Star[200]; 
public void setup() 
{
  size(1000, 1000);
  frameRate(60);
  
  bobship = new Spaceship();
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
  
  
}
public void draw() 
{
  background(0);
  for(int i = 0; i < stars.length; i++)
    stars[i].show();
  bobship.move();
  bobship.show();
  
}
public void keyPressed(){
  if(key == 'W' || key == 'w'){
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

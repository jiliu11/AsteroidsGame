class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  private float mySize;
  private int myColor;
  public Star(){
    myX = (int)(Math.random()*1000.0);
    myY = (int)(Math.random()*1000.0);
    mySize = (int)(Math.random() * 7.0);
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  public void show(){
    noStroke();
    fill(myColor);    
    ellipse(myX, myY, mySize, mySize); 
    if(Math.random() > 0.9)
      myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));;
    if(Math.random() > 0.99)
      myColor= color(0);
    
  }
}

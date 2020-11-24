class Star //note that this class does NOT extend Floater
{
  class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  private float mySize;
  public Star(){
    myX = (int)(Math.random()*1000.0);
    myY = (int)(Math.random()*1000.0);
    mySize = (int)(Math.random() * 5.0);
  }
  public void show(){
    fill(255);
    ellipse(myX, myY, mySize, mySize); 
  }
}
}

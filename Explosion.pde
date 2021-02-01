class Explosion{
  private int myColor;
  private int myStroke;
  private int numPieces;
  private int transparency = 255;
  private int fadeSpeed = 5;
  
  private ArrayList<Piece> pieces;

  
  public Explosion (color meColor,int piecesgah,double x, double y){
    pieces = new ArrayList<Piece>();  
    for(int i = 0; i < numPieces; i++){
        pieces.add(new Piece(x, y, meColor)); 
      }
  }
  
  public void explode(){
    for(int i = 0; i < pieces.size(); i++){
      pieces.get(i).show();
      pieces.get(i).move();
    }
  }
}
class Piece extends Floater{
  private int size;
  private double rotateSpeed;
  private int fadeSpeed = 5;
  private int faded = 255;
  
  public Piece(double x, double y, int mColor){
    
    corners = 4;   
    xCorners = new int[]{size, -size, -size, size};   
    yCorners = new int[]{size , size, -size , -size};     
    myColor = mColor;   
    myCenterX = x;
    myCenterY = y; //holds center coordinates   
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random() * 360.0; 
    rotateSpeed = Math.random()*20 - 10;  
  }
  public void move(){
    super.move();
    myPointDirection += rotateSpeed;
  }
  
  public void show(){
    fill(myColor, faded);
    faded -= fadeSpeed;
    stroke(myColor);
    
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

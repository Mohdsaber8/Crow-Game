class Field{
  final int x= 300;
  final int y=500;
  
  PImage Corn= loadImage("CornField.png");
  
  boolean  collision(Field other)
  {
  int distanceX = abs(this.x-other.x); //difference in x positions
  int distanceY = abs(this.y-other.y); //difference in y positions
   return distanceX<20 && distanceY<20;
  }
}

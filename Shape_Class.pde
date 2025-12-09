class Shape{
  String type;
  int numShapes, move;
  float[] diameter;
  color[] shapeCol;
  float xSpeed, ySpeed, xPoint, yPoint;
  boolean right;
  
  Shape(String t, int n, float x, float y, float xS, float yS){
   this.type = t;
   this.numShapes = n;
   this.diameter = new float[this.numShapes];
   this.shapeCol = new color[this.numShapes];
   this.xPoint = x;
   this.yPoint = y;
   this.right = true;
   this.move = 0;
   this.xSpeed = xS;
   this.ySpeed = yS;
   for(int i = 0; i < this.numShapes; i++){
    this.diameter[i] = ((width*5)/this.numShapes)*(this.numShapes-i);
    this.shapeCol[i] = color(random(50,125), random(150,225), random(150,225));
   }
  }
  
  void drawShape(){
   if(this.type.equals("circle")){
     for(int i = 0; i < this.numShapes; i++){
        circle(this.center.x, this.center.y, this.diameter[i]);
        fill(this.shapeCol[i]);
     }
   }
   else if(this.type.equals("square")){
     for(int i = 0; i < this.numShapes; i++){
        square(this.center.x, this.center.y, this.diameter[i]);
        fill(this.shapeCol[i]);
     }
   }
   if(!right){
    this.center.x -= xSpeed;
    this.center.y -= ySpeed;
    this.move ++;
    if(this.move > 50){
      right = true;
    }
   }
   else{
    this.center.x += xSpeed;
    this.center.y += ySpeed;
    this.move --;
    if(this.move < -50){
      right = false;
    }
   }
  }
}

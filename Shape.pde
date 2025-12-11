// FOR OPTICAL RELAXATION
class Shape {
  // Fields
  String type;
  int numShapes, move;
  float[] diameter;
  color[] shapeCol;
  float xSpeed, ySpeed, xPoint, yPoint;
  boolean right;

  // Constructor
  Shape(String t, int n, float x, float y, float xS, float yS) {
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
    
    for (int i = 0; i < this.numShapes; i++) {
      this.diameter[i] = (width*4/this.numShapes)*(this.numShapes-i);
      this.shapeCol[i] = color(random(50, 125), random(150, 225), random(150, 225));
    }
  }

  // Methods
  void drawShape() {
    noStroke();

    if (this.type.equals("circle")) {
      for (int i = 0; i < this.numShapes; i++) {
        fill(this.shapeCol[i]);
        circle(this.xPoint, this.yPoint, this.diameter[i]);
      }
    } 
    else if (this.type.equals("square")) {
      for (int i = 0; i < this.numShapes; i++) {
        fill(this.shapeCol[i]);
        square(this.xPoint, this.yPoint, this.diameter[i]);
      }
    }

    if (!right) {
      this.xPoint -= xSpeed;
      this.yPoint -= ySpeed;
      this.move ++;

      if (this.move > 50) {
        right = true;
      }
    } 
    else {
      this.xPoint += xSpeed;
      this.yPoint += ySpeed;
      this.move --;
      
      if (this.move < -50) {
        right = false;
      }
    }
    
  }
}

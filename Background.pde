class Background {
  float fSpeed;
  float bShade;
  float bColour;
  int choice;
  PImage image;
  boolean fadeOut;
  
  Background(float bs, float fs) {
    this.fSpeed = fs;
    this.bShade = bs;
    this.bColour = 255/( this.bShade*this.fSpeed );
    this.fadeOut = curQuote.fadeOut;
    chooseImage();
  }
  
  void chooseImage() { 
    int prevChoice = this.choice;
    
    do {
      this.choice = int(random(0,1.99));
    }
    while (prevChoice == this.choice);
    
    this.image = quoteBgs[choice];
  }
  
  void display() {
    tint(this.bColour*this.fSpeed);
    image(this.image, 0, 0, width, height);
  }
  
  void update() {
    if (this.fadeOut)
      this.bColour -= 1/this.bShade;
    
    else
      this.bColour += 1/this.bShade;
 
    this.fadeOut = curQuote.fadeOut;
  }
  
}

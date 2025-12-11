// ENCOURAGING WORDS
class QuoteBackground {
  // Fields
  float fSpeed;
  float bShade;
  float bColour;
  int choice;
  PImage image;
  boolean fadeOut;
  
  // Constructor
  QuoteBackground(float bs, float fs) {
    this.fSpeed = fs;
    this.bShade = bs;
    this.bColour = 255/( this.bShade*this.fSpeed );
    this.fadeOut = curQuote.fadeOut;
    chooseImage();
  }
  
  // Methods
  void chooseImage() { 
    int prevChoice = this.choice;
    
    do {
      this.choice = int(random(0,quoteBgsCount));
    }
    while (prevChoice == this.choice);
    
    this.image = quoteBgs[this.choice];
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

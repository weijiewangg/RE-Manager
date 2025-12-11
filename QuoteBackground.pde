// ENCOURAGING WORDS
class QuoteBackground {
  // Fields
  int choice; // index of background choice in background arrays
  PImage image; // background image
  float fSpeed; // fade speed 
  float bShade; // darkness of background compared to quote
  float bColour; // tint of background
  boolean fadeOut; // whether the background is fading out or not
  
  // Constructor
  QuoteBackground(float bs, float fs) {
    chooseImage();
    this.fSpeed = fs;
    this.bShade = bs;
    this.bColour = 255/( this.bShade*this.fSpeed );
    this.fadeOut = curQuote.fadeOut;
  }
  
  // Methods
  void chooseImage() { 
    // records the index of the previous image chosen
    int prevChoice = this.choice;
    
    // chooses a new index once
    do {
      this.choice = int(random(0,quoteBgsCount));
    }
    // repeats while new index chosen is the same as previous index
    while (prevChoice == this.choice);
    
    // gets new image with index
    this.image = quoteBgs[this.choice];
  }
  
  // display image
  void display() {
    tint(this.bColour*this.fSpeed); // tint to darken the background
    image(this.image, 0, 0, width, height);
  }
  
  // update background 
  void update() {
    // update colour values
    if (this.fadeOut)
      this.bColour -= 1/this.bShade;
    
    else
      this.bColour += 1/this.bShade;
 
    // match fade out state to quote fade out state
    this.fadeOut = curQuote.fadeOut;
  }
  
}

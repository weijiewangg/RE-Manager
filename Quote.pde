// ENCOURAGING WORDS
class Quote {
  // Fields
  float qRatio; // chance of choosing a fun quote
  String choice; // quote chosen
  float fSpeed; // fade speed of text
  float colour; // text colour
  boolean fadeOut; // whether the text is fading out or not
  
  // Constructor
  Quote(float qr, float fs) {
    this.qRatio = qr;
    this.fSpeed = fs;
    this.colour = 255/fs;
    this.fadeOut = true;
    chooseQuote(this.qRatio);
  }
  
  // Methods
  // chooses a random quote, but higher chance of a fun or serious quote depending on the user's preference 
  void chooseQuote(float funRatio) {
    float dataChoice = random(0, 1); // can choose from funData or srsData
    
    // records the previous quote chosen
    String prevChoice = this.choice;

    // chooses a new quote once
    do {    
      if (dataChoice < funRatio) { // choose a fun quote
        int choiceNum = int(random(0, funData.length));
        this.choice = funData[choiceNum];
      }
      
      else { // choose a serious quote
        int choiceNum = int(random(0, srsData.length));
        this.choice = srsData[choiceNum];
      }
    }
    // repeats choosing while the previous quote is equal to the quote chosen
    while (this.choice == null || this.choice.equals(prevChoice));
    
  }
  
  // display quote text
  void display() {
    fill(round(this.colour*this.fSpeed));
  
    textSize(70);
    textAlign(LEFT, CENTER);
    text(this.choice, 50, 0, width-100, height);
  }
  
  // update text
  void update() {
    // update colour values for fading
    if (this.fadeOut)
      this.colour--;
    
    else
      this.colour++;
    
    // chooses new quote and background after screen fully fades
    if (this.colour <= 0) {
      this.chooseQuote(this.qRatio);
      curBg.chooseImage();
    }
    
    // if 0 and 255 ranges are exceeded
    if (this.colour <= 0 || this.colour >= 255/this.fSpeed){
      // reset colour values within the 0 and 255 range
      if (this.fadeOut)
        this.colour += 1;
        
      else
        this.colour -= 1;
      
      // update fade out state
      this.fadeOut = !this.fadeOut;
    }
  }

}

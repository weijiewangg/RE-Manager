class Quote {
  float qRatio;
  String choice;
  float fSpeed; // fade speed of text
  float colour; // text colour
  boolean fadeOut;
  
  Quote(float qr, float fs) {
    this.qRatio = qr;
    this.fSpeed = fs;
    this.colour = 255/fs;
    this.fadeOut = true;
    chooseQuote(this.qRatio);
  }
  
  void chooseQuote(float funRatio) {
    float dataChoice = random(0, 1); // can choose from funData or srsData
    
    String prevChoice = this.choice;

    while (this.choice == null || this.choice.equals(prevChoice)) {
      if (dataChoice < funRatio) {
        int choiceNum = int(random(0, funData.length));
        this.choice = funData[choiceNum];
      }
      
      else {
        int choiceNum = int(random(0, srsData.length));
        this.choice = srsData[choiceNum];
      }
    }
  }
  
  void display() {
    fill(round(this.colour*this.fSpeed));
  
    textSize(70);
    textAlign(LEFT, CENTER);
    text(this.choice, 50, 0, width-100, height);
    
    // update colour values
    if (this.fadeOut)
      this.colour--;
    
    else
      this.colour++;
    
    if (this.colour <= 0) {
      this.chooseQuote(qRatio);
      curBg.chooseImage();
    }
    
    // if 0 and 255 ranges are exceeded
    if (round(this.colour) <= 0 || round(this.colour) >= 255/this.fSpeed){
      // reset colour values within the 0 and 255 range
      if (this.fadeOut)
        this.colour++;
        
      else
        this.colour--;
      
      // update fade out state
      this.fadeOut = !this.fadeOut;
    }
  }

}

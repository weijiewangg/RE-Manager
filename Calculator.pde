class Calculator {
  float taskLength, pSleepLength, pSleepTime, wakeTime;
  float sleepLength, sleepTime;
  
  Calculator(float tT, float pST, float pSL, float wT) {
    this.taskLength = tT;
    this.pSleepLength = pSL;
    this.pSleepTime = pST;
    this.wakeTime = wT;
  }
  
  void calculateSleepLength() {
    float sleepDiff = 8 - this.pSleepTime; // calculates amount of sleep diff with 8 hours (ideal amount of sleep)
    
    float sleepChange;
    
    if (sleepDiff > 0) 
      sleepChange = min(2, 0.75*sleepDiff);
    
    else
      sleepChange = max(-2, 0.75*sleepDiff);
    
    this.sleepLength = this.pSleepTime + sleepChange;
  }
  
  void calculateSleepTime() {
    float freeTime = 23 - sleepLength - taskLength; // free time calculated with 23 hours to leave 1 hour extra time
    
    if (freeTime < 0) {
      this.sleepLength += freeTime; // reduce sleep length so free time can be 0;
      freeTime = 0;
    }
    
    float reqSleepTime = wakeTime - sleepLength;
    this.sleepTime = min(reqSleepTime, pSleepTime);
  }
  
  public String representTime (float time) {
    int hour;
    String minutes, period;
    
    if (time < 12) {
      hour = floor(time);
      minutes = nf(round((time - hour)*60));
      period = "PM";
    }
    
    else {
      hour = floor(time - 12);
      minutes = nf(round((time - 12 - hour)*60));
      period = "AM";
    }
    
    if (hour == 0)
      hour = 12;
      
    if (float(minutes) < 10) 
      minutes = "0" + minutes;
    
    return (hour + ":" + minutes + " " + period); 
  }
  
  
  void display() {
    image(menuBg, 0, 0, 800, 600);
    
    textSize(70);
    textAlign(LEFT, CENTER);
    fill(10);
    text("You can get " + nf(sleepLength, 0, 1) + " hours of sleep starting at " + representTime(sleepTime) + 
    " so you can wake up at " + representTime(sleepTime+sleepLength) + ".", 50, 0, width-100, height);
  }
}

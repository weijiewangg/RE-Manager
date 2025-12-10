// BEST SLEEP CALCULATOR
class Calculator {
  // Fields
  float taskLength, wakeTime; // required task length and wake time of user
  float pSleepLength, pSleepTime; // previous sleep length and sleep time of user
  float sleepLength, sleepTime; // suggested sleep length and sleep time
  
  // Constructor
  Calculator(float tT, float pST, float pSL, float wT) {
    this.taskLength = tT;
    this.wakeTime = wT;
    this.pSleepLength = pSL;
    this.pSleepTime = pST;
  }
  
  // Methods
  void calculateSleepLength() {
    // calculates diff of previous sleep with 8 hours (ideal amount of sleeps
    float sleepDiff = 8 - this.pSleepTime; 
    
    // recommended increase / decrease in user's sleep
    float sleepChange;
    
    // reduces strength of sleepDiff and limits the change to 2 hours to prevent sudden changes    
    if (sleepDiff > 0) 
      sleepChange = min(2, 0.75*sleepDiff);
    
    else
      sleepChange = max(-2, 0.75*sleepDiff);
    
    // recommended sleep length
    this.sleepLength = this.pSleepTime + sleepChange;
  }
  
  void calculateSleepTime() {
    // free time calculated with 23 hours to leave 1 hour extra time in case things don't work out
    float freeTime = 23 - sleepLength - taskLength; 
    
    // reduce sleep length if free time is negative
    if (freeTime < 0) {
      this.sleepLength += freeTime;
      freeTime = 0; // sets free time back to 0
    }
    
    // determines required sleep time
    float reqSleepTime = wakeTime - sleepLength;
    
    // choose recommended sleep time from the earlier one between the required and previous sleep time
    this.sleepTime = min(reqSleepTime, pSleepTime);
  }
  
  // represent float of hours after 12 pm into XX:XX form
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
  
  // display text 
  void display() {
    image(menuBg, 0, 0, 800, 600);
    
    textSize(70);
    textAlign(LEFT, CENTER);
    fill(10);
    text("You can get " + nf(sleepLength, 0, 1) + " hours of sleep starting at " + representTime(sleepTime) + 
    " so you can wake up at " + representTime(sleepTime+sleepLength) + ".", 50, 0, width-100, height);
  }
}

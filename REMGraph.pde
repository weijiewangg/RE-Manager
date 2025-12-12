class REMGraph {
  //Fields
  float sleepHours, wakeHours, N1, N2, N3, REM;
  ArrayList<Float> startTimes;   // stage start times (in hours)
  ArrayList<Float> endTimes;     // stage end times
  ArrayList<Integer> stageID;    // 1=N1, 2=N2, 3=N3, 4=REM
  
  //Constructor
  REMGraph() {
    this.startTimes = new ArrayList<Float>();
    this.endTimes   = new ArrayList<Float>();
    this.stageID    = new ArrayList<Integer>();
    this.N1 = 5; // 5 minutes
    this.N2 = 15; // 15 minutes
    this.N3 = 30; // 30 minutes
    this.REM = 40; // 40 minutes
  }
  
  //Methods
  float convertTo24(float hour, boolean isPM) { // converts to 24 hour clock
    if (isPM && hour < 12) return hour + 12;   // Example: 7 PM -> 19
    if (!isPM && hour == 12) return 0;         // 12 AM -> 0
    return hour;
  }

  void setTimes(float sH, boolean sPM, float wH, boolean wPM) {   // Called when sliders change — sets sleep/wake hours

    sleepHours = convertTo24(sH, sPM);
    wakeHours  = convertTo24(wH, wPM);

    // If you go to sleep before midnight and wake after midnight
    if (wakeHours <= sleepHours)
      wakeHours += 24;
    buildNight();
  }

  void buildNight() {   // Generate 90-minute cycles

    // Reset previous cycles
    startTimes.clear();
    endTimes.clear();
    stageID.clear();

    float t = sleepHours; 

    while (t < wakeHours) {
      float total = N1 + N2 + N3 + REM; // one sleep cycle is 1h30 minutes
      float scale = 90f / total;

      N1 *= scale; N2 *= scale; N3 *= scale; REM *= scale; // makes sure it scales dynamically

      addStage(t, N1, 1); // N1 stage
      addStage(t + N1/60f, N2, 2); // N2 stage
      addStage(t + (N1+N2)/60f, N3, 3); // N3 stage
      addStage(t + (N1+N2+N3)/60f, REM,4); // REM stage
      
      t += 1.5f; // Next 90-minute cycle
    }
  }

  void addStage(float start, float durMin, int id) { // Add a sleep stage to graph
    startTimes.add(start); // stores start time of current sleep stage
    endTimes.add(start + durMin / 60f); // stores end time of current sleep stage (for drawing bar correctly)
    stageID.add(id); // which stage we are on
  }

  void renderGraph(PApplet app, int w, int h) { // Draw the bar graph
    // Layout
    int left = 80;
    int right = w - 40;
    int top = 120;
    int bottom = h - 60;
    float spanHours = wakeHours - sleepHours;
    float graphWidth = right - left;

    // Axes
    app.stroke(0);
    app.strokeWeight(2);
    app.line(left, bottom, right, bottom);
    app.line(left, bottom, left, top);

    // Drawing Y-axis labels
    drawYLabel(app, bottom, "Awake", 0, top);
    drawYLabel(app, bottom, "N1 (Light)", 1, top);
    drawYLabel(app, bottom, "N2 (Light)", 2, top);
    drawYLabel(app, bottom, "N3 (Deep)", 3, top);
    drawYLabel(app, bottom, "REM", 4, top);

    for (int i = 0; i < startTimes.size(); i++) {// Draws each sleep stage segment as a vertical bar

      float x1 = map(startTimes.get(i), sleepHours, wakeHours, left, right); // converts start times to x pos
      float x2 = map(endTimes.get(i), sleepHours, wakeHours, left, right); // converts end times to x pos

      float barW = x2 - x1; // bar width
      float y = map(stageID.get(i), 0, 4, bottom, top); // maps each stage of sleep into vertical bar

      // Stage colors
      if (stageID.get(i) == 1) app.fill(255,215,90); // N1 = yellow
      if (stageID.get(i) == 2) app.fill(80,230,200); // N2 = aqua
      if (stageID.get(i) == 3) app.fill(90,170,255);//N3 = blue
      if (stageID.get(i) == 4) app.fill(40,60,140); // REM = navy blue

      app.noStroke();
      app.rect(x1, y, barW, bottom - y); // draws bars
    }

    // Hides :30 ticks if graph is too compressed
    float pixelsPerHour = graphWidth / spanHours;
    boolean hide30 = pixelsPerHour < 50;

    // Drawing ticks and time labels
    for (float hh = 0; hh <= spanHours + 0.0001; hh += 0.5) { // hh = hours since sleep started, adding 0.0001 makes sure wake up time tick is generated

      float x = map(hh, 0, spanHours, left, right); // scales ticks to be drawn from left to right of the graph

      app.stroke(0);
      app.line(x, bottom, x, bottom + 5); // draws tick marks

      float actualTime = sleepHours + hh;
      String label = formatTime(actualTime); //float into readable label

      float frac = actualTime - floor(actualTime);
      int minute = round(frac * 60);// minute
      if (minute == 60) minute = 0;

      boolean isZero = (abs(hh) < 0.01);
      boolean isHour = (minute == 0);
      boolean isHalf = (minute == 30);

      app.textAlign(CENTER);
      
      // Decides which labels to draw
      if (isZero) { 
        app.fill(0);
        app.textSize(11);
        app.text(label, x, bottom+20);
      }
      else if (isHour) {
        app.fill(0);
        app.textSize(11);
        app.text(label, x, bottom+20);
      }
      else if (isHalf && !hide30) {
        app.fill(60);
        app.textSize(8);
        app.text(label, x, bottom+15);
      }
    }
  }
  
  String formatTime(float hour) { // Converts hour float into readable clock

    int hr24 = ((int)floor(hour)) % 24; // removes any decimal for hour portion
    if (hr24 < 0) {
      hr24 += 24;
    }
    
    float frac = hour - floor(hour); //turns .5 into :30
    int min = round(frac * 60); 
    
    if (min == 60) { // handles rounding errors
    min = 0; 
    hr24 = (hr24 + 1)%24; // carries the hour forward
  }

    int hr12 = hr24 % 12; // converst 24hr to 12hr
    if (hr12 == 0) {
      hr12 = 12; // 0 -> 12 AM, 12 -> 12 PM
    }

    String ampm = (hr24 >= 12 ? "PM" : "AM"); // determines AM or PM

    if (min == 0) {
      return hr12 + ampm; //shows xPM/AM
    }
    else {
      return hr12 + ":30" + ampm; // shows x:30PM/AM
    }
  }

  void drawYLabel(PApplet app, int bottom, String label, int stage, int top) { //Y-axis labels
    float y = map(stage, 0, 4, bottom, top); // stage is a value that ranges from bottom to top
    app.fill(0);
    app.textSize(12);
    app.textAlign(RIGHT, CENTER);
    app.text(label, 60, y);
  }
}

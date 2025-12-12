// ================================================
// ===============  REM SLEEP GRAPH  ===============
// ================================================

class REMGraph {

  // USER INPUT (from sliders)
  float sleepHours, wakeHours;
  boolean sleepPM, wakePM;

  // INTERNAL DATA
  ArrayList<Float> times   = new ArrayList<Float>(); // X axis timestamps
  ArrayList<Integer> stages = new ArrayList<Integer>(); // Y axis sleep stage markers

  // STAGE INDEX:
  // 0 = Awake (not used in middle of sleep but used for axis)
  // 1 = N1
  // 2 = N2
  // 3 = N3 (Deep)
  // 4 = REM

  // -------------------------------
  // MAIN UPDATE FROM UI
  // -------------------------------
  void setTimes(float sleepH, boolean sleepIsPM, float wakeH, boolean wakeIsPM) {

    sleepHours = convertTo24(sleepH, sleepIsPM);
    wakeHours  = convertTo24(wakeH,  wakeIsPM);

    // Ensure wake time is after sleep time
    if (wakeHours <= sleepHours) {
      wakeHours += 24;
    }

    buildNightCycles();
  }


  // -------------------------------
  // CONVERT 12H TO 24H FORMAT
  // -------------------------------
  float convertTo24(float t, boolean pm) {
    if (pm && t < 12) return t + 12;
    if (!pm && t == 12) return 0;
    return t;
  }

  // Convert minutes → hours
  float minToHr(float m) { return m / 60.0; }


  // ---------------------------------------------------------
  // BUILD SLEEP CYCLES — deterministic (NO RANDOMNESS)
  // ---------------------------------------------------------
  void buildNightCycles() {

    times.clear();
    stages.clear();

    float t = sleepHours;
    int cycle = 0;

    while (t < wakeHours) {

      // Predict end of the 90-minute cycle
      float cycleEnd = t + 1.5;
      if (cycleEnd > wakeHours) cycleEnd = wakeHours;

      // -----------------------------------
      // FIXED REALISTIC DURATION PER CYCLE
      // -----------------------------------

      float N1_d, N2_d, N3_d, REM_d;

      if (cycle == 0) {
        // First cycle
        N1_d  = 5;
        N2_d  = 25;
        N3_d  = 35;  // Most deep sleep early night
        REM_d = 10;  // Shortest REM
      }
      else if (cycle == 1) {
        N1_d  = 5;
        N2_d  = 30;
        N3_d  = 25;
        REM_d = 30;
      }
      else if (cycle == 2) {
        N1_d  = 5;
        N2_d  = 35;
        N3_d  = 10;  // Less deep sleep later
        REM_d = 40;
      }
      else {
        // Later cycles: mostly light sleep + long REM
        N1_d  = 5;
        N2_d  = 40;
        N3_d  = 5;
        REM_d = 40;
      }

      // Normalize total to exactly 90 mins
      float total = N1_d + N2_d + N3_d + REM_d;
      float scale = 90.0 / total;

      N1_d *= scale;
      N2_d *= scale;
      N3_d *= scale;
      REM_d *= scale;

      // Add stages in sequence
      addStage(t,                      N1_d, 1);
      addStage(t + minToHr(N1_d),      N2_d, 2);
      addStage(t + minToHr(N1_d + N2_d), N3_d, 3);
      addStage(t + minToHr(N1_d + N2_d + N3_d), REM_d, 4);

      // Move forward 90 minutes
      t += 1.5;
      cycle++;
    }
  }


  // Add the stage to the timeline
  void addStage(float start, float durMinutes, int stage) {
    float end = start + minToHr(durMinutes);

    times.add(start);
    stages.add(stage);

    times.add(end);
    stages.add(stage);
  }


  // ----------------------------------------------
  // DRAW THE GRAPH IN MAIN WINDOW
  // ----------------------------------------------
  void renderGraph(PApplet appc, int w, int h) {

    int left = 140;
    int right = w - 40;
    int top = 80;
    int bottom = h - 60;

    // Background
    appc.background(230);

    // Axes
    appc.stroke(0);
    appc.strokeWeight(2);
    appc.line(left, bottom, right, bottom); // X
    appc.line(left, bottom, left, top);     // Y

    // Y labels
    drawYLabel(appc, bottom, "Awake", 0);
    drawYLabel(appc, bottom, "N1 (Light)", 1);
    drawYLabel(appc, bottom, "N2 (Light)", 2);
    drawYLabel(appc, bottom, "N3 (Deep)", 3);
    drawYLabel(appc, bottom, "REM", 4);

    // X labels (one per hour)
    // --- X-AXIS TIME LABELS ---        // smaller labels
    
    // label every **2 hours** for spacing (change to 1 if you prefer)
    // --- X AXIS TIME LABELS (SMALLER + FIRST LABEL AT ORIGIN) ---
    appc.textAlign(CENTER);
    appc.fill(0);
    appc.textSize(10);
    
    // 1️⃣ FIRST LABEL: SLEEP TIME EXACTLY AT LEFT AXIS
    float originClock = sleepHours % 24;
    appc.text(formatClock(originClock), left, bottom + 20);
    
    // 2️⃣ HOURLY LABELS AFTER THAT
    float totalH = wakeHours - sleepHours;
    
    for (int i = 1; i <= totalH; i++) {
      float x = map(i, 0, totalH, left, right);
      float clock = (sleepHours + i) % 24;
      appc.text(formatClock(clock), x, bottom + 20);
    }



    // ----------------------
    // Draw line graph
    // ----------------------
    appc.noFill();
    appc.stroke(30, 90, 255);   // blue line
    appc.strokeWeight(3);

    appc.beginShape();
    for (int i = 0; i < times.size(); i++) {
      float x = map(times.get(i), sleepHours, wakeHours, left, right);
      float y = map(stages.get(i), 0, 4, bottom, top);
      appc.curveVertex(x, y);
    }
    appc.endShape();
  }


  // Y-axis labels helper
  void drawYLabel(PApplet appc, int bottom, String label, int stage) {
    float y = map(stage, 0, 4, bottom, 80);
  
    appc.fill(0);            // ← force black text
    appc.textSize(12);       // ← match x-axis size
    appc.textAlign(RIGHT, CENTER);
    appc.text(label, 135, y);
  }


  // Clock label formatting
  String formatClock(float t) {
    int hr = floor(t);
    String ampm = (hr >= 12) ? "PM" : "AM";
    int h12 = hr % 12;
    if (h12 == 0) h12 = 12;
    return h12 + ampm;
  }
}

/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void sound(PApplet appc, GWinData data) { //_CODE_:soundWindow:485901:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  soundTitle.setFont(font);
} //_CODE_:soundWindow:485901:

public void songClicked(GDropList source, GEvent event) { //_CODE_:song:957168:
  player.setSound(source.getSelectedText());
  println("Selected sound:" + source.getSelectedText());
} //_CODE_:song:957168:

public void volumeSliderMoved(GCustomSlider source, GEvent event) { //_CODE_:volumeSlider:252865:
  float sliderVal = source.getValueF();
  float vol = sliderVal / 100.0;
  player.setVolume(vol);
} //_CODE_:volumeSlider:252865:

public void playButtonPressed(GButton source, GEvent event) { //_CODE_:playButton:242089:
  player.play();
  println("Sound playing");
} //_CODE_:playButton:242089:

public void pauseButtonPressed(GButton source, GEvent event) { //_CODE_:pauseButton:530668:
  player.pauseSound();
  println("Sound paused");
} //_CODE_:pauseButton:530668:

synchronized public void support(PApplet appc, GWinData data) { //_CODE_:supportWindow:474696:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  supportTitle.setFont(font);
} //_CODE_:supportWindow:474696:

public void hrsSleepSliderChange(GCustomSlider source, GEvent event) { //_CODE_:hrsSleepSlider:262179:
  hrsSleep = hrsSleepSlider.getValueF();
  println("hrsSleep = " + hrsSleep);
} //_CODE_:hrsSleepSlider:262179:

synchronized public void calc(PApplet appc, GWinData data) { //_CODE_:calcWindow:361504:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  calcTitle.setFont(font);
} //_CODE_:calcWindow:361504:

public void taskLengthSliderChange(GCustomSlider source, GEvent event) { //_CODE_:taskLengthSlider:956967:
  curtL = taskLengthSlider.getValueF();
  println("taskLength = " + curtL);
} //_CODE_:taskLengthSlider:956967:

public void wakeTimeSliderChange(GCustomSlider source, GEvent event) { //_CODE_:wakeTimeSlider:884513:
  curwT = wakeTimeSlider.getValueF();
  
  println("wakeTime = " + curwT);
} //_CODE_:wakeTimeSlider:884513:

public void periodChange(GDropList source, GEvent event) { //_CODE_:period:651337:
  if (source.getSelectedText() == "AM") 
    curwT += 12;
} //_CODE_:period:651337:

public void pSleepTimeSliderChange(GCustomSlider source, GEvent event) { //_CODE_:pSleepTimeSlider:493808:
  curpST = pSleepTimeSlider.getValueF();
  println("SleepTime = " + curpST);
} //_CODE_:pSleepTimeSlider:493808:

public void period2Change(GDropList source, GEvent event) { //_CODE_:period2:940316:
  if (source.getSelectedText() == "AM") 
    curpST += 12;
} //_CODE_:period2:940316:

public void pSleepLengthSliderChange(GCustomSlider source, GEvent event) { //_CODE_:pSleepLengthSlider:827478:
  curpSL = pSleepLengthSlider.getValueF();
  println("SleepLength = " + curpSL);
} //_CODE_:pSleepLengthSlider:827478:

synchronized public void words(PApplet appc, GWinData data) { //_CODE_:wordsWindow:591454:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  wordsTitle.setFont(font);
} //_CODE_:wordsWindow:591454:

public void fSpeedSliderChange(GCustomSlider source, GEvent event) { //_CODE_:fSpeedSlider:410252:
  curQuote.fSpeed = fSpeedSlider.getValueF();
  println("Speed = " + curQuote);
} //_CODE_:fSpeedSlider:410252:

public void bShadeSliderChange(GCustomSlider source, GEvent event) { //_CODE_:bShadeSlider:881798:
  curBg.bShade = bShadeSlider.getValueF();
  println("Shade = " + curBg.bShade);
} //_CODE_:bShadeSlider:881798:

public void qRatioSliderChange(GCustomSlider source, GEvent event) { //_CODE_:qRatioSlider:578708:
  curQuote.qRatio = qRatioSlider.getValueF();
  println("Ratio = " + curQuote.qRatio);
} //_CODE_:qRatioSlider:578708:

synchronized public void optical(PApplet appc, GWinData data) { //_CODE_:opticalWindow:226382:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  opticalTitle.setFont(font);
} //_CODE_:opticalWindow:226382:

public void Shape_Click(GDropList source, GEvent event) { //_CODE_:Shape:581383:
  type = Shape.getSelectedText();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("Shape selected: " + type);
} //_CODE_:Shape:581383:

public void shapesNum_change(GCustomSlider source, GEvent event) { //_CODE_:shapesNum:852609:
  numShapes = shapesNum.getValueI();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("numShapes = " + numShapes);
} //_CODE_:shapesNum:852609:

public void xPoint_change1(GCustomSlider source, GEvent event) { //_CODE_:xPointSlider:597249:
  xPoint = xPointSlider.getValueF();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("xCenter = " + xPoint);
} //_CODE_:xPointSlider:597249:

public void yPoint_change1(GCustomSlider source, GEvent event) { //_CODE_:yPointSlider:950924:
  yPoint = yPointSlider.getValueF();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("yCenter = " + yPoint);
} //_CODE_:yPointSlider:950924:

public void xSpeed1_change1(GCustomSlider source, GEvent event) { //_CODE_:xSpeed1:674915:
  xSpeed = xSpeed1.getValueF();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("xSpeed = " + xSpeed);
} //_CODE_:xSpeed1:674915:

public void ySpeed1_change1(GCustomSlider source, GEvent event) { //_CODE_:ySpeed1:456798:
  ySpeed = ySpeed1.getValueF();
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  println("ySpeed = " + ySpeed);
} //_CODE_:ySpeed1:456798:

synchronized public void graph(PApplet appc, GWinData data) { //_CODE_:graphWindow:832583:
  appc.background(230);
  Font font = new Font("Arial", Font.PLAIN, 20);
  graphTitle.setFont(font);
} //_CODE_:graphWindow:832583:

public void AM1_clicked(GOption source, GEvent event) { //_CODE_:AM1:758752:
} //_CODE_:AM1:758752:

public void PM1_clicked(GOption source, GEvent event) { //_CODE_:PM1:595985:
} //_CODE_:PM1:595985:

public void sleepSliderValue(GCustomSlider source, GEvent event) { //_CODE_:sleepSlider:712134:
} //_CODE_:sleepSlider:712134:

public void wakeSliderValue(GCustomSlider source, GEvent event) { //_CODE_:wakeSlider:881061:
} //_CODE_:wakeSlider:881061:

public void AM2_clicked(GOption source, GEvent event) { //_CODE_:AM2:585301:
} //_CODE_:AM2:585301:

public void PM2_clicked(GOption source, GEvent event) { //_CODE_:PM2:432570:
} //_CODE_:PM2:432570:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  soundWindow = GWindow.getWindow(this, "Soothing Sound Player", 0, 0, 400, 300, JAVA2D);
  soundWindow.noLoop();
  soundWindow.setActionOnClose(G4P.KEEP_OPEN);
  soundWindow.addDrawHandler(this, "sound");
  song = new GDropList(soundWindow, 150, 155, 90, 120, 5, 10);
  song.setItems(loadStrings("list_957168"), 0);
  song.addEventHandler(this, "songClicked");
  volumeSlider = new GCustomSlider(soundWindow, 110, 100, 170, 50, "grey_blue");
  volumeSlider.setShowValue(true);
  volumeSlider.setShowLimits(true);
  volumeSlider.setLimits(100, 0, 100);
  volumeSlider.setNbrTicks(11);
  volumeSlider.setShowTicks(true);
  volumeSlider.setNumberFormat(G4P.INTEGER, 0);
  volumeSlider.setOpaque(false);
  volumeSlider.addEventHandler(this, "volumeSliderMoved");
  playButton = new GButton(soundWindow, 60, 210, 80, 30);
  playButton.setText("Play");
  playButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  playButton.addEventHandler(this, "playButtonPressed");
  pauseButton = new GButton(soundWindow, 250, 210, 80, 30);
  pauseButton.setText("Pause");
  pauseButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  pauseButton.addEventHandler(this, "pauseButtonPressed");
  volume = new GLabel(soundWindow, 155, 75, 80, 20);
  volume.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  volume.setText("Volume");
  volume.setOpaque(false);
  soundTitle = new GLabel(soundWindow, 70, 12, 256, 48);
  soundTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  soundTitle.setText("Soothing Sound Player");
  soundTitle.setOpaque(false);
  supportWindow = GWindow.getWindow(this, "Sleep Support", 0, 0, 300, 180, JAVA2D);
  supportWindow.noLoop();
  supportWindow.setActionOnClose(G4P.KEEP_OPEN);
  supportWindow.addDrawHandler(this, "support");
  hrsSleepSlider = new GCustomSlider(supportWindow, 60, 100, 170, 55, "grey_blue");
  hrsSleepSlider.setShowValue(true);
  hrsSleepSlider.setShowLimits(true);
  hrsSleepSlider.setLimits(8.0, 0.0, 24.0);
  hrsSleepSlider.setNbrTicks(5);
  hrsSleepSlider.setShowTicks(true);
  hrsSleepSlider.setNumberFormat(G4P.DECIMAL, 1);
  hrsSleepSlider.setOpaque(false);
  hrsSleepSlider.addEventHandler(this, "hrsSleepSliderChange");
  hrsSleepLabel = new GLabel(supportWindow, 95, 70, 100, 20);
  hrsSleepLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  hrsSleepLabel.setText("Hours of sleep");
  hrsSleepLabel.setOpaque(false);
  supportTitle = new GLabel(supportWindow, 60, 20, 170, 40);
  supportTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  supportTitle.setText("Sleep Support");
  supportTitle.setOpaque(false);
  calcWindow = GWindow.getWindow(this, "Best Sleep Calculator", 0, 0, 700, 300, JAVA2D);
  calcWindow.noLoop();
  calcWindow.setActionOnClose(G4P.KEEP_OPEN);
  calcWindow.addDrawHandler(this, "calc");
  taskLengthSlider = new GCustomSlider(calcWindow, 550, 130, 110, 50, "grey_blue");
  taskLengthSlider.setShowValue(true);
  taskLengthSlider.setShowLimits(true);
  taskLengthSlider.setLimits(0.0, 0.0, 24.0);
  taskLengthSlider.setNbrTicks(5);
  taskLengthSlider.setShowTicks(true);
  taskLengthSlider.setNumberFormat(G4P.DECIMAL, 1);
  taskLengthSlider.setOpaque(false);
  taskLengthSlider.addEventHandler(this, "taskLengthSliderChange");
  taskLabel = new GLabel(calcWindow, 550, 90, 105, 20);
  taskLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  taskLabel.setText("Hours of tasks");
  taskLabel.setOpaque(false);
  wakeTimeSlider = new GCustomSlider(calcWindow, 360, 130, 120, 50, "grey_blue");
  wakeTimeSlider.setShowValue(true);
  wakeTimeSlider.setShowLimits(true);
  wakeTimeSlider.setLimits(9.0, 0.0, 12.0);
  wakeTimeSlider.setNbrTicks(5);
  wakeTimeSlider.setShowTicks(true);
  wakeTimeSlider.setNumberFormat(G4P.DECIMAL, 1);
  wakeTimeSlider.setOpaque(false);
  wakeTimeSlider.addEventHandler(this, "wakeTimeSliderChange");
  period = new GDropList(calcWindow, 375, 200, 90, 60, 2, 10);
  period.setItems(loadStrings("list_651337"), 0);
  period.addEventHandler(this, "periodChange");
  label1 = new GLabel(calcWindow, 340, 90, 160, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Desired wake up time");
  label1.setOpaque(false);
  disclaimer = new GLabel(calcWindow, 340, 240, 150, 35);
  disclaimer.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  disclaimer.setText("(Wake up time may not be granted*)");
  disclaimer.setOpaque(false);
  pSleepTimeSlider = new GCustomSlider(calcWindow, 185, 130, 110, 50, "grey_blue");
  pSleepTimeSlider.setShowValue(true);
  pSleepTimeSlider.setShowLimits(true);
  pSleepTimeSlider.setLimits(9.0, 0.0, 12.0);
  pSleepTimeSlider.setNbrTicks(5);
  pSleepTimeSlider.setShowTicks(true);
  pSleepTimeSlider.setNumberFormat(G4P.DECIMAL, 1);
  pSleepTimeSlider.setOpaque(false);
  pSleepTimeSlider.addEventHandler(this, "pSleepTimeSliderChange");
  sleepTimeSlider = new GLabel(calcWindow, 175, 90, 131, 20);
  sleepTimeSlider.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  sleepTimeSlider.setText("Past sleep time (hrs)");
  sleepTimeSlider.setOpaque(false);
  period2 = new GDropList(calcWindow, 195, 200, 90, 60, 2, 10);
  period2.setItems(loadStrings("list_940316"), 0);
  period2.addEventHandler(this, "period2Change");
  pSleepLengthSlider = new GCustomSlider(calcWindow, 20, 130, 120, 50, "grey_blue");
  pSleepLengthSlider.setShowValue(true);
  pSleepLengthSlider.setShowLimits(true);
  pSleepLengthSlider.setLimits(8.0, 0.0, 24.0);
  pSleepLengthSlider.setNbrTicks(5);
  pSleepLengthSlider.setShowTicks(true);
  pSleepLengthSlider.setNumberFormat(G4P.DECIMAL, 1);
  pSleepLengthSlider.setOpaque(false);
  pSleepLengthSlider.addEventHandler(this, "pSleepLengthSliderChange");
  pSleepLengthLabel = new GLabel(calcWindow, 15, 90, 131, 20);
  pSleepLengthLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  pSleepLengthLabel.setText("Past sleep length (hrs)");
  pSleepLengthLabel.setOpaque(false);
  calcTitle = new GLabel(calcWindow, 200, 10, 250, 55);
  calcTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  calcTitle.setText("Best Sleep Calculator");
  calcTitle.setOpaque(false);
  wordsWindow = GWindow.getWindow(this, "Encouraging Words", 0, 0, 500, 200, JAVA2D);
  wordsWindow.noLoop();
  wordsWindow.setActionOnClose(G4P.KEEP_OPEN);
  wordsWindow.addDrawHandler(this, "words");
  fSpeedSlider = new GCustomSlider(wordsWindow, 190, 125, 120, 50, "grey_blue");
  fSpeedSlider.setShowValue(true);
  fSpeedSlider.setShowLimits(true);
  fSpeedSlider.setLimits(1.0, 0.5, 2.0);
  fSpeedSlider.setNbrTicks(5);
  fSpeedSlider.setShowTicks(true);
  fSpeedSlider.setNumberFormat(G4P.DECIMAL, 1);
  fSpeedSlider.setOpaque(false);
  fSpeedSlider.addEventHandler(this, "fSpeedSliderChange");
  fadeLabel = new GLabel(wordsWindow, 180, 75, 140, 40);
  fadeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  fadeLabel.setText("Fade speed");
  fadeLabel.setOpaque(false);
  bShadeSlider = new GCustomSlider(wordsWindow, 350, 125, 120, 50, "grey_blue");
  bShadeSlider.setShowValue(true);
  bShadeSlider.setShowLimits(true);
  bShadeSlider.setLimits(2.5, 1.0, 5.0);
  bShadeSlider.setNbrTicks(6);
  bShadeSlider.setShowTicks(true);
  bShadeSlider.setNumberFormat(G4P.DECIMAL, 1);
  bShadeSlider.setOpaque(false);
  bShadeSlider.addEventHandler(this, "bShadeSliderChange");
  bShadeLabel = new GLabel(wordsWindow, 340, 75, 140, 40);
  bShadeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  bShadeLabel.setText("Background darkness");
  bShadeLabel.setOpaque(false);
  qRatioSlider = new GCustomSlider(wordsWindow, 30, 125, 120, 50, "grey_blue");
  qRatioSlider.setShowValue(true);
  qRatioSlider.setShowLimits(true);
  qRatioSlider.setLimits(0.5, 0.0, 1.0);
  qRatioSlider.setNbrTicks(5);
  qRatioSlider.setShowTicks(true);
  qRatioSlider.setNumberFormat(G4P.DECIMAL, 1);
  qRatioSlider.setOpaque(false);
  qRatioSlider.addEventHandler(this, "qRatioSliderChange");
  qRatioLabel = new GLabel(wordsWindow, 20, 75, 140, 40);
  qRatioLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  qRatioLabel.setText("Funny Quote Chance");
  qRatioLabel.setOpaque(false);
  wordsTitle = new GLabel(wordsWindow, 120, 20, 250, 48);
  wordsTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  wordsTitle.setText("Encouraging Words");
  wordsTitle.setOpaque(false);
  opticalWindow = GWindow.getWindow(this, "Optical Relaxation", 0, 0, 700, 350, JAVA2D);
  opticalWindow.noLoop();
  opticalWindow.setActionOnClose(G4P.KEEP_OPEN);
  opticalWindow.addDrawHandler(this, "optical");
  opticalTitle = new GLabel(opticalWindow, 175, 15, 340, 70);
  opticalTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  opticalTitle.setText("Optical Relaxation");
  opticalTitle.setOpaque(false);
  shapeTitle = new GLabel(opticalWindow, 150, 100, 80, 20);
  shapeTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  shapeTitle.setText("Shape");
  shapeTitle.setOpaque(false);
  Shape = new GDropList(opticalWindow, 145, 135, 90, 60, 2, 10);
  Shape.setItems(loadStrings("list_581383"), 0);
  Shape.addEventHandler(this, "Shape_Click");
  shapeNumTitle = new GLabel(opticalWindow, 450, 100, 110, 20);
  shapeNumTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  shapeNumTitle.setText("Number of Shapes");
  shapeNumTitle.setOpaque(false);
  shapesNum = new GCustomSlider(opticalWindow, 425, 130, 160, 50, "grey_blue");
  shapesNum.setShowValue(true);
  shapesNum.setShowLimits(true);
  shapesNum.setLimits(150, 0, 300);
  shapesNum.setNbrTicks(11);
  shapesNum.setShowTicks(true);
  shapesNum.setNumberFormat(G4P.INTEGER, 0);
  shapesNum.setOpaque(false);
  shapesNum.addEventHandler(this, "shapesNum_change");
  xPointSlider = new GCustomSlider(opticalWindow, 10, 250, 150, 50, "grey_blue");
  xPointSlider.setShowValue(true);
  xPointSlider.setShowLimits(true);
  xPointSlider.setLimits(200.0, 0.0, 400.0);
  xPointSlider.setNbrTicks(11);
  xPointSlider.setShowTicks(true);
  xPointSlider.setNumberFormat(G4P.DECIMAL, 1);
  xPointSlider.setOpaque(false);
  xPointSlider.addEventHandler(this, "xPoint_change1");
  xPointTitle = new GLabel(opticalWindow, 45, 215, 80, 20);
  xPointTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  xPointTitle.setText("xCenter");
  xPointTitle.setOpaque(false);
  yPointSlider = new GCustomSlider(opticalWindow, 180, 250, 150, 50, "grey_blue");
  yPointSlider.setShowValue(true);
  yPointSlider.setShowLimits(true);
  yPointSlider.setLimits(200.0, 0.0, 400.0);
  yPointSlider.setNbrTicks(11);
  yPointSlider.setShowTicks(true);
  yPointSlider.setNumberFormat(G4P.DECIMAL, 1);
  yPointSlider.setOpaque(false);
  yPointSlider.addEventHandler(this, "yPoint_change1");
  yPointTitle = new GLabel(opticalWindow, 215, 215, 80, 20);
  yPointTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  yPointTitle.setText("yCenter");
  yPointTitle.setOpaque(false);
  xSpeed1 = new GCustomSlider(opticalWindow, 350, 250, 150, 50, "grey_blue");
  xSpeed1.setShowValue(true);
  xSpeed1.setShowLimits(true);
  xSpeed1.setLimits(10.0, 0.0, 15.0);
  xSpeed1.setNbrTicks(4);
  xSpeed1.setShowTicks(true);
  xSpeed1.setNumberFormat(G4P.DECIMAL, 1);
  xSpeed1.setOpaque(false);
  xSpeed1.addEventHandler(this, "xSpeed1_change1");
  xSpeedTitle = new GLabel(opticalWindow, 385, 215, 80, 20);
  xSpeedTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  xSpeedTitle.setText("xSpeed");
  xSpeedTitle.setOpaque(false);
  ySpeed1 = new GCustomSlider(opticalWindow, 520, 250, 150, 50, "grey_blue");
  ySpeed1.setShowValue(true);
  ySpeed1.setShowLimits(true);
  ySpeed1.setLimits(10.0, 0.0, 15.0);
  ySpeed1.setNbrTicks(4);
  ySpeed1.setShowTicks(true);
  ySpeed1.setNumberFormat(G4P.DECIMAL, 1);
  ySpeed1.setOpaque(false);
  ySpeed1.addEventHandler(this, "ySpeed1_change1");
  ySpeedTitle = new GLabel(opticalWindow, 550, 215, 80, 20);
  ySpeedTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ySpeedTitle.setText("ySpeed");
  ySpeedTitle.setOpaque(false);
  graphWindow = GWindow.getWindow(this, "REM Sleep Graph", 0, 0, 500, 250, JAVA2D);
  graphWindow.noLoop();
  graphWindow.setActionOnClose(G4P.KEEP_OPEN);
  graphWindow.addDrawHandler(this, "graph");
  graphTitle = new GLabel(graphWindow, 125, 20, 241, 50);
  graphTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  graphTitle.setText("REM Sleep Graph");
  graphTitle.setOpaque(false);
  sleepTimeTitle = new GLabel(graphWindow, 85, 100, 80, 20);
  sleepTimeTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  sleepTimeTitle.setText("Sleep TIme");
  sleepTimeTitle.setOpaque(false);
  AMPMS = new GToggleGroup();
  AM1 = new GOption(graphWindow, 60, 185, 60, 20);
  AM1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  AM1.setText("AM");
  AM1.setOpaque(false);
  AM1.addEventHandler(this, "AM1_clicked");
  PM1 = new GOption(graphWindow, 130, 185, 60, 20);
  PM1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  PM1.setText("PM");
  PM1.setOpaque(false);
  PM1.addEventHandler(this, "PM1_clicked");
  AMPMS.addControl(AM1);
  AMPMS.addControl(PM1);
  PM1.setSelected(true);
  sleepSlider = new GCustomSlider(graphWindow, 15, 130, 220, 50, "grey_blue");
  sleepSlider.setShowValue(true);
  sleepSlider.setShowLimits(true);
  sleepSlider.setLimits(6.0, 1.0, 12.0);
  sleepSlider.setNbrTicks(23);
  sleepSlider.setStickToTicks(true);
  sleepSlider.setShowTicks(true);
  sleepSlider.setNumberFormat(G4P.DECIMAL, 1);
  sleepSlider.setOpaque(false);
  sleepSlider.addEventHandler(this, "sleepSliderValue");
  wakeSlider = new GCustomSlider(graphWindow, 265, 130, 220, 50, "grey_blue");
  wakeSlider.setShowValue(true);
  wakeSlider.setShowLimits(true);
  wakeSlider.setLimits(6.0, 1.0, 12.0);
  wakeSlider.setNbrTicks(23);
  wakeSlider.setStickToTicks(true);
  wakeSlider.setShowTicks(true);
  wakeSlider.setNumberFormat(G4P.DECIMAL, 1);
  wakeSlider.setOpaque(false);
  wakeSlider.addEventHandler(this, "wakeSliderValue");
  AMPMW = new GToggleGroup();
  AM2 = new GOption(graphWindow, 310, 185, 60, 20);
  AM2.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  AM2.setText("AM");
  AM2.setOpaque(false);
  AM2.addEventHandler(this, "AM2_clicked");
  PM2 = new GOption(graphWindow, 380, 185, 60, 20);
  PM2.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  PM2.setText("PM");
  PM2.setOpaque(false);
  PM2.addEventHandler(this, "PM2_clicked");
  AMPMW.addControl(AM2);
  AM2.setSelected(true);
  AMPMW.addControl(PM2);
  wakeTimeTitle = new GLabel(graphWindow, 335, 100, 80, 20);
  wakeTimeTitle.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  wakeTimeTitle.setText("Wake Time");
  wakeTimeTitle.setOpaque(false);
  soundWindow.loop();
  supportWindow.loop();
  calcWindow.loop();
  wordsWindow.loop();
  opticalWindow.loop();
  graphWindow.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow soundWindow;
GDropList song; 
GCustomSlider volumeSlider; 
GButton playButton; 
GButton pauseButton; 
GLabel volume; 
GLabel soundTitle; 
GWindow supportWindow;
GCustomSlider hrsSleepSlider; 
GLabel hrsSleepLabel; 
GLabel supportTitle; 
GWindow calcWindow;
GCustomSlider taskLengthSlider; 
GLabel taskLabel; 
GCustomSlider wakeTimeSlider; 
GDropList period; 
GLabel label1; 
GLabel disclaimer; 
GCustomSlider pSleepTimeSlider; 
GLabel sleepTimeSlider; 
GDropList period2; 
GCustomSlider pSleepLengthSlider; 
GLabel pSleepLengthLabel; 
GLabel calcTitle; 
GWindow wordsWindow;
GCustomSlider fSpeedSlider; 
GLabel fadeLabel; 
GCustomSlider bShadeSlider; 
GLabel bShadeLabel; 
GCustomSlider qRatioSlider; 
GLabel qRatioLabel; 
GLabel wordsTitle; 
GWindow opticalWindow;
GLabel opticalTitle; 
GLabel shapeTitle; 
GDropList Shape; 
GLabel shapeNumTitle; 
GCustomSlider shapesNum; 
GCustomSlider xPointSlider; 
GLabel xPointTitle; 
GCustomSlider yPointSlider; 
GLabel yPointTitle; 
GCustomSlider xSpeed1; 
GLabel xSpeedTitle; 
GCustomSlider ySpeed1; 
GLabel ySpeedTitle; 
GWindow graphWindow;
GLabel graphTitle; 
GLabel sleepTimeTitle; 
GToggleGroup AMPMS; 
GOption AM1; 
GOption PM1; 
GCustomSlider sleepSlider; 
GCustomSlider wakeSlider; 
GToggleGroup AMPMW; 
GOption AM2; 
GOption PM2; 
GLabel wakeTimeTitle; 

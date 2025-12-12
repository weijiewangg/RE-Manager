// LIBRARIES
import g4p_controls.*;
import processing.sound.*;
import java.awt.Font;

// REM SLEEP GRAPH VARIABLES
REMGraph remGraph = new REMGraph();

// SOUND PLAYER VARIABLES
SoundFile file;
SoothingSoundPlayer player;

// SLEEP SUPPORT VARIABLES
float hrsSleep;

// BEST SLEEP CALCULATOR VARIABLES
BestSleepCalculator sleepCalc;

// OPTICAL RELAXATION VARIABLES
Shape s;
float xSpeed = 15; 
float ySpeed = 15; 
float xPoint = 400; 
float yPoint = 400;
String type = "circle";
int numShapes = 300;

// ENCOURAGING WORDS VARIABLES
// can change
float curqRatio = 0.4; // ratio of funny to serious quotes
float curfSpeed = 2; // fade speed of the text and background
float curbShade = 2; // how dark the background to the text

// don't change
Quote curQuote;
QuoteBackground curBg;
PImage[] quoteBgs;
int quoteBgsCount = 5;

String funData[];
String srsData[];

// MAIN MENU VARIABLES
color btnCol = color(255, 240, 255, 180);
color btnHover = color(230, 205, 230, 200);
color btnText = color(80, 60, 120);

String[] buttonLabels = {"Sleep Support", "Best Sleep Calculator", "REM Sleep Graph", "Soothing Sound Player", "Optical Relaxation", "Encouraging Words"};

// Button positions
float bx = 90;
float by = 350;
float bw = 300;
float bh = 60;

// Booleans for what's running
boolean supportRun = false;
boolean calcRun = false;
boolean graphRun = false;
boolean soundRun = false;
boolean relaxRun = false;
boolean wordsRun = false;
boolean menuRun = true;

PImage logo, menuBg; // menu images

// HOME BUTTON VARIABLES
PImage home;

public void setup(){
  // set up screen display
  size(800, 600);
  textAlign(CENTER, CENTER);
  //frameRate(30);
  
  // set up GUI, all GUI starts invisible
  createGUI();
  customGUI();
  soundWindow.setVisible(false);
  
  // BEST SLEEP CALCULATOR
  sleepCalc = new BestSleepCalculator(); 
  
  // SOOTHING SOUND PLAYER
  player = new SoothingSoundPlayer(this);
  
  // OPTICAL RELAXATION
  s = new Shape(type, numShapes, xPoint, yPoint, xSpeed, ySpeed);
  
  // ENCOURAGING WORDS
  // load quote data
  funData = loadStrings("Funny words.txt");
  srsData = loadStrings("Serious words.txt");   
  quoteBgs = new PImage[quoteBgsCount];
  for (int i = 0; i < quoteBgsCount; i++) {
    quoteBgs[i] = loadImage((i+1) + ".jpg");
  }
  
  // create initial quote and background
  curQuote = new Quote(curqRatio, curfSpeed); 
  curBg = new QuoteBackground(curbShade, curfSpeed);


  // MENU + HOME BUTTON
  logo = loadImage("REM.png"); 
  menuBg = loadImage("menuBackground.jpg");
  home = loadImage("home.png");
}

public void draw(){  
  if (supportRun == true) {
    sleepSupport();
    createHomeButton();
  }
  
  else if (calcRun == true) {
    sleepCalc = new BestSleepCalculator(curtL, curpST, curpSL, curwT); 
    sleepCalc.calculateSleepLength();
    sleepCalc.calculateSleepTime();
    sleepCalc.display();
    createHomeButton();
  }

  else if (graphRun == true) {

      background(230);    // Clear screen
    
      // --- READ UI VALUES (live updating) ---
      float sleepH = sleepSlider.getValueF();
      float wakeH  = wakeSlider.getValueF();
    
      boolean sleepIsPM = PM1.isSelected();
      boolean wakeIsPM  = PM2.isSelected();
    
      // --- UPDATE GRAPH DATA EVERY FRAME ---
      remGraph.setTimes(sleepH, sleepIsPM, wakeH, wakeIsPM);
    
      // --- DRAW GRAPH IN MAIN WINDOW ---
      remGraph.renderGraph(this, width, height);
    
      // Home button
      createHomeButton();
    }
  
  else if (soundRun == true) {
    createMenu();
    soundWindow.setVisible(true);
  } 
    
  else if (relaxRun == true) {
    background(230);
    s.drawShape();
    createHomeButton();
  }
  
  else if (wordsRun == true) {
    // curQuote = new Quote(curqRatio, curfSpeed); 
  //curBg = new QuoteBackground(curbShade, curfSpeed);
  
    curQuote.update(); 
    curBg.update();
    
    curBg.display(); 
    curQuote.display();
    createHomeButton();
  }
  
  else if (menuRun == true) {
    createMenu();
    soundWindow.setVisible(false);
    wordsWindow.setVisible(false);
    calcWindow.setVisible(false);
    supportWindow.setVisible(false);
    opticalWindow.setVisible(false);
    graphWindow.setVisible(false);
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

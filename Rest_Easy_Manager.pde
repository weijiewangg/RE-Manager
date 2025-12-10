// LIBRARIES
import g4p_controls.*;
import processing.sound.*;
import java.awt.Font;

// SOUND PLAYER VARIABLES
SoundFile file;
SoothingSoundPlayer player;

// SLEEP SUPPORT VARIABLES
float hrsSleep;

// OPTICAL RELAXATION VARIABLES
Shape s;

// ENCOURAGING WORDS VARIABLES
// can change
float quoteRatio = 0.4; // ratio of funny to serious quotes
float curfSpeed = 2; // fade speed of the text and background
float curbShade = 2; // how dark the background is relative to the text

// don't change
Quote curQuote;
QuoteBackground curBg;
PImage[] quoteBgs;
int quoteBgsCount = 5;

String funData[];
String srsData[];

// MAIN MENU VARIABLES
color btnCol = color(255, 240, 255, 180);
color btnHover = color(255, 220, 255, 200);
color btnText = color(80, 60, 120);

String[] buttonLabels = {"Sleep Support", "Best Sleep Calculator", "Encouraging Words", "Soothing Sound Player", "Optical Relaxation", "REM Sleep Graph" };

// Button positions
float bx = 90;
float by = 350;
float bw = 300;
float bh = 60;

// Booleans for what's running
boolean supportRun = false;
boolean calcRun = false;
boolean wordsRun = false;
boolean soundRun = false;
boolean relaxRun = false;
boolean graphRun = false;
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
  sound.setVisible(false);
  
  // SOOTHING SOUND PLAYER
  player = new SoothingSoundPlayer(this);
  
  // OPTICAL RELAXATION
  s = new Shape("circle", 30, 300, 300, 15, 15);
  
  // ENCOURAGING WORDS
  // load quote data
  funData = loadStrings("Funny words.txt");
  srsData = loadStrings("Serious words.txt");   
  quoteBgs = new PImage[quoteBgsCount];
  for (int i = 0; i < quoteBgsCount; i++) {
    quoteBgs[i] = loadImage((i+1) + ".jpg");
  }
  
  // create initial quote and background
  curQuote = new Quote(quoteRatio, curfSpeed); 
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
    createMenu();
  }
  
  else if (wordsRun == true) {
    curQuote.update(); // fix display and update order?
    curBg.update();
    
    curBg.display(); 
    curQuote.display();
    createHomeButton();
  }
  
  else if (soundRun == true) {
    createMenu();
    sound.setVisible(true);
  } 
    
  else if (relaxRun == true) {
    background(230);
    s.drawShape();
    createHomeButton();
  }
  
  else if (graphRun == true) {
    createMenu();
  }
  
  else if (menuRun == true) {
    createMenu();
    sound.setVisible(false);
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

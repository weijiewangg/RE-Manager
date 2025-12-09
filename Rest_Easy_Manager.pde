// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;
import processing.sound.*;
import java.awt.Font;
SoundFile file;
SoothingSoundPlayer player;
PImage logo, menuBg;

float hrsSleep;
Shape s1;

// encouraging words global variables
float quoteRatio = 0.4;
int quoteBgsCount = 5;

float curfSpeed = 2; // fade speed of the text and background
float curbShade = 2; // how dark the background is relative to the text

Quote curQuote;
Background curBg;
PImage[] quoteBgs;

String funData[];
String srsData[];

// main menu global variables
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

public void setup(){
  // set up menu display
  size(800, 600, JAVA2D);
  textAlign(CENTER, CENTER);
  
  // set up GUI, all GUI starts invisible
  createGUI();
  customGUI();
  sound.setVisible(false);
  
  player = new SoothingSoundPlayer(this);
  
  s1 = new Shape("circle", 80, 300, 300, 15, 15);
  
  // load quote data
  funData = loadStrings("Funny words.txt");
  srsData = loadStrings("Serious words.txt");   
  quoteBgs = new PImage[quoteBgsCount];
  for (int i = 0; i < quoteBgsCount; i++) {
    quoteBgs[i] = loadImage((i+1) + ".jpg");
  }
  
  // create initial quote and background
  curQuote = new Quote(quoteRatio, curfSpeed); 
  curBg = new Background(curbShade, curfSpeed);

  logo = loadImage("REM.png"); 
  menuBg = loadImage("menuBackground.jpg");
}

//public void draw(){
//  background(230);
//  s1.drawShape();

//  
//}

public void draw(){  
  if (wordsRun == true) {
    curQuote.update(); // fix display and update order?
    curBg.update();
    
    
    curBg.display(); 
    curQuote.display();
  }
  
  else if (relaxRun == true) {
    noStroke();
    sleepSupport();
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

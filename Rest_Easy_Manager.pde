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

// encouraging words global variables
float quoteRatio = 0.4;

float curfSpeed = 2; // fade speed of the text and background
float curbShade = 2; // how dark the background is relative to the text

Quote curQuote;
Background curBg;

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
boolean soundRun = false;
boolean calcRun = false;
boolean relaxRun = false;
boolean wordsRun = false;
boolean graphRun = false;

public void setup(){
  size(800, 600, JAVA2D);
  textAlign(CENTER, CENTER);
  createGUI();
  customGUI();
  
  player = new SoothingSoundPlayer(this);

  // load quote data
  funData = loadStrings("Funny words.txt");
  srsData = loadStrings("Serious words.txt");   
  
  // create initial quote and background
  curQuote = new Quote(quoteRatio, curfSpeed); 
  curBg = new Background(curbShade, curfSpeed);
  
  logo = loadImage("REM.png"); 
  menuBg = loadImage("menuBackground.jpg");
}

public void draw(){  
  if (supportRun) {
  }
  
  else if (soundRun) {
    sound.setVisible(true);
  }
  
  else if (calcRun) {
  }
  
  else if (relaxRun) {
  }
  
  else if (wordsRun) {
  }
  
  else if (graphRun) {
  }
  
  else {
    createMenu();
    sound.setVisible(false);
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

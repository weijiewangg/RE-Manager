// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;
PImage bg;
import processing.sound.*;
SoundFile file;
import java.awt.Font;
SoothingSoundPlayer player;
color btnCol = color(255, 240, 255, 180);
color btnHover = color(255, 220, 255, 200);
color btnText = color(80, 60, 120);

String[] buttonLabels = {"Sleep Support", "Best Sleep Calculator", "Encouraging Words", "Soothing Sound Player", "Optical Relaxation", "REM Sleep Graph" };

// Button positions
float bx = 90;
float by = 350;
float bw = 300;
float bh = 60;


public void setup(){
  size(800, 600, JAVA2D);
  textAlign(CENTER, CENTER);
  createGUI();
  customGUI();
  player = new SoothingSoundPlayer(this);
  bg = loadImage("REM.png"); 
}

public void draw(){
  background(230);
  image(bg, 100, 0, 600, 350);
  
  textFont(createFont("Arial", 24));
  for (int i = 0; i < 2; i++) {
    float x = bx + i * (bw + 20);
    
    for (int j = 0; j < 3; j++) {
      float y = by + j * (bh + 20);
      
      if (mouseX > x && mouseX < x + bw && mouseY > y && mouseY < y + bh) // Hover effect
        fill(btnHover);
     
      else 
        fill(btnCol);
  
      // Button box
      stroke(180, 130, 200);
      strokeWeight(2);
      rect(x, y, bw, bh, 20);
      noStroke();
  
      // Button text
      fill(btnText);
      text(buttonLabels[i*3+j], x + bw/2, y + bh/2);
    }
  }
}

  void mousePressed() {
  for (int i = 0; i < 6; i++) {
    float y = by + i * (bh + 20);
    if (mouseX > bx && mouseX < bx + bw && mouseY > y && mouseY < y + bh) {
      println("Button clicked: " + buttonLabels[i]);
    }
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

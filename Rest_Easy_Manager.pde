// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;
import processing.sound.*;
SoundFile file;
import java.awt.Font;
SoothingSoundPlayer player;

float hrsSleep;
Shape s1;

public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  player = new SoothingSoundPlayer(this);
  
  noStroke();
  //sleepSupport();
  s1 = new Shape("circle", 80, 300, 300, 15, 15);
}

public void draw(){
  background(230);
  s1.drawShape();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

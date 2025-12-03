// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;
import processing.sound.*;
SoundFile file;
import java.awt.Font;
SoothingSoundPlayer player;


public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  player = new SoothingSoundPlayer(this);
}

public void draw(){
  background(230);
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

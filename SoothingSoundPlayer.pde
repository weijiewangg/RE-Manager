// SOOTHING SOUND PLAYER
class SoothingSoundPlayer {
  // Fields
  SoundFile file;
  String currentName; // name from dropdown
  float volume = 1;  // default volume (100%)
  PApplet parent;

  // Constructor
  SoothingSoundPlayer(PApplet p) {
    this.parent = p;
    this.currentName = "None";
  }
  
  // Methods
  void setSound(String name) { // Called when dropdown changes
    currentName = name;
    println("Selected sound: " + currentName);
  }

  void play() {
    if (file != null) {
      file.stop(); // Stops previous audio if needed
    }

    if (currentName.equals("Rain")) {
      file = new SoundFile(parent, "rain.mp3");
    } 
    else if (currentName.equals("White Noise")) {
      file = new SoundFile(parent, "whiteNoise.mp3");
    } 
    else if (currentName.equals("Rainforest")){
      file = new SoundFile(parent, "rainforest.mp3");
    }
    else if (currentName.equals("Wind Chimes")){
      file = new SoundFile(parent, "windChimes.mp3");
    }
    else if (currentName.equals("None")){
      println("No sound selected!");
      return;
    }
    
    file.amp(volume);
    file.play();
  }

  // Pause playback
  void pauseSound() {
    if (file != null) {
      file.pause();
    }
  }
  
  // Volume slider changed
  void setVolume(float v) {
    volume = v;
    if (file != null) { // Updates volume instantly when sound is playing
      file.amp(volume);
    }

    println("Volume set to: " + nf(volume, 1, 2));
  }
}

void mousePressed() {
  if (menuRun == true) {
    for (int i = 0; i < 2; i++) {
      float x = bx + i * (bw + 20);
      
      for (int j = 0; j < 3; j++) {
        float y = by + j * (bh + 20);
        
        if (mouseX > x && mouseX < x + bw && mouseY > y && mouseY < y + bh) {
          int index = i*3+j;
          println("Button clicked: " + buttonLabels[index]);
          
          wordsRun = false;
          menuRun = false;
          sound.setVisible(false);
          
          // sleep support
          if (index == 0) {
          }
          
          // best sleep calculator
          else if (index == 1) {
          }
          
          // encouraging words
          else if (index == 2) {
            wordsRun = true;
  
          }
          
          // soothing sound player
          else if (index == 3) {
            sound.setVisible(true);
          }
          
          // optical relaxation
          else if (index == 4) {
          }
          
          // REM sleep graph
          else {
          }
          
        }
      }
    }
  }
  
}

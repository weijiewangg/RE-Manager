void mousePressed() {
  if (menuRun == true || soundRun == true) {
    for (int i = 0; i < 2; i++) {
      float x = bx + i * (bw + 20);
      
      for (int j = 0; j < 3; j++) {
        float y = by + j * (bh + 20);
        
        if (mouseX > x && mouseX < x + bw && mouseY > y && mouseY < y + bh) {
          int index = i*3+j;
          println("Button clicked: " + buttonLabels[index]);
          
          supportRun = false;
          calcRun = false;
          graphRun = false;
          soundRun = false;
          relaxRun = false;
          wordsRun = false;
          menuRun = false;
          sound.setVisible(false);
          
          // sleep support
          if (index == 0) {
            supportRun = true;
          }
          
          // best sleep calculator
          else if (index == 1) {
            calcRun = true;
          }
          
          // encouraging words
          else if (index == 2) {
            graphRun = true;            
          }
          
          // soothing sound player
          else if (index == 3) {
            soundRun = true;
            sound.setVisible(true);
          }
          
          // optical relaxation
          else if (index == 4) {
            relaxRun = true;
          }
          
          // REM sleep graph
          else {
            wordsRun = true;
          }
          
        }
      }
    }
  }
  
  if (supportRun == true || wordsRun == true || relaxRun == true) {
    if (mouseX > 15 && mouseX < 75 && mouseY > 15 && mouseY < 75) {
      supportRun = false;
      calcRun = false;
      graphRun = false;
      soundRun = false;
      relaxRun = false;
      wordsRun = false;
      menuRun = true;
    }
  }
  
}

void createMenu() {
  image(menuBg, 0, 0, 800, 600);
  image(logo, 100, 0, 600, 350);
    
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
  for (int i = 0; i < 2; i++) {
    float x = bx + i * (bw + 20);
    
    for (int j = 0; j < 3; j++) {
      float y = by + j * (bh + 20);
      
      if (mouseX > x && mouseX < x + bw && mouseY > y && mouseY < y + bh) {
        int index = i*3+j;
        println("Button clicked: " + buttonLabels[index]);
        
        supportRun = false;
        soundRun = false;
        calcRun = false;
        relaxRun = false;
        wordsRun = false;
        graphRun = false;
        sound.setVisible(false);
        
        if (index == 0) {
          supportRun = true;
        }
        
        else if (index == 1) {
          calcRun = true;
        }
        
        else if (index == 2) {
          wordsRun = true;
        }
        
        else if (index == 3) {
          soundRun = true;
        }
        
        else if (index == 4) {
          relaxRun = true;
        }
        
        else {
          graphRun = true;
        }
        
      }
    }
  }
}

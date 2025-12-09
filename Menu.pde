void createMenu() {
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
  for (int i = 0; i < 2; i++) {
    float x = bx + i * (bw + 20);
    
    for (int j = 0; j < 3; j++) {
      float y = by + j * (bh + 20);
      
      if (mouseX > x && mouseX < x + bw && mouseY > y && mouseY < y + bh) {
        println("Button clicked: " + buttonLabels[i*3+j]);
      }
    }
  }
}

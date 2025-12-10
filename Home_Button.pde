void createHomeButton() { 
  // Fill home button
  if (mouseX > 15 && mouseX < 75 && mouseY > 15 && mouseY < 75) { // Hover effect
    fill(btnHover, 200);
  }
  
  else {
    fill(btnCol, 200);
  }
  
  stroke(5);
  square(15, 15, 60);
  image(home, 20, 20, 50, 50);
}

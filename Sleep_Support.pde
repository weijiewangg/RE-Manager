// SLEEP SUPPORT
void sleepSupport() {
  // background
  image(menuBg, 0, 0, 800, 600);
  
  // text settings
  fill(10);
  textSize(70);
  textAlign(LEFT, CENTER);

  // different text based on no of hours of sleep
  if (hrsSleep < 7) {
    text("Try getting more sleep to feel better throughout the day!", 50, 0, width-100, height);
  }
  else if (hrsSleep > 14) {
    text("I think the user might be dead, can someone check up on them?", 50, 0, width-100, height);
  }
  else if (hrsSleep > 9) {
    text("That might be more sleep than you need in a day.", 50, 0, width-100, height);
  } 
  else {
    text("That's a good amount of sleep per day!", 50, 0, width-100, height);
  }
}

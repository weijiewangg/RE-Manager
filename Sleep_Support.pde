void sleepSupport(){
  background(0);
  fill(255);
  textSize(30);
  
 if(hrsSleep < 7){
   text("Try getting more sleep to feel better throughout the day!", 50, 300);
 }
 else if(hrsSleep > 9){
   text("That might be more sleep than you need in a day.", 50, 300);
 }
 else{
   text("That's a good amount of sleep per day!", 50, 300);
 }
}

float r = 0.4;
String wChoice;
int imgChoice = 1;
PImage background;

float fSpeed = 2; // fade speed of the text and background
float tColour = 255/fSpeed; // text colour
float bShade = 2; // how dark the background is relative to the text
float bColour = 255/(bShade*fSpeed); // background image tint
boolean fadeOut = true;

String chooseWords(float funRatio) {
  // load quote data
  String funData[] = loadStrings("Funny words.txt");
  String srsData[] = loadStrings("Serious words.txt");
  
  float[] dataOptions = {0, 1}; // can choose from funData or srsData
  float[] dataProbs = {funRatio, 1-funRatio}; // probabilities of choosing each data array
  float dataChoice = choice(dataOptions, dataProbs);
  
  String wordChoice = "";
  
  if (dataChoice == 0) {
    int wordChoiceNum = int(random(0, funData.length));
    wordChoice = funData[wordChoiceNum];
  }
  
  else {
    int wordChoiceNum = int(random(0, srsData.length));
    wordChoice = srsData[wordChoiceNum];
  }
  
  return wordChoice;
}

void drawInspiringBg() {
  tint(bColour*fSpeed);
  image(background, 0, 0, width, height);

  // update background colour
  if (fadeOut)
    bColour -= 1/bShade;
  
  else
    bColour += 1/bShade;
    
}

void drawWords() {
  fill(round(tColour*fSpeed));
  
  //createText(wChoice, 70, 50);
  textSize(70);
  textAlign(LEFT, CENTER);
  text(wChoice, 50, 0, width-100, height);
  
  // update colour values
  if (fadeOut)
    tColour--;
  
  else
    tColour++;
  
  // select new quote and background after previous quote fades out 
  if (tColour <= 0) {
    String curwChoice = wChoice;
    
    while (curwChoice.equals(wChoice))
      wChoice = chooseWords(r);
      
    int curimgChoice = imgChoice;
    
    while (curimgChoice == imgChoice)
      imgChoice = int(random(1,2.99));
    
    background = loadImage(imgChoice + ".jpg");
  }
  
  // if 0 and 255 ranges are exceeded
  if (round(tColour) <= 0 || round(tColour) >= 255/fSpeed){
    // reset colour values within the 0 and 255 range
    if (fadeOut)
      tColour++;
      
    else
      tColour--;
    
    // update fade out state
    fadeOut = !fadeOut;
  }
  
}

// choice function for randomly choosing from a list of options
float choice(float[] options, float[] probs) { // probs array represents the probability to obtain each respective option
  int l = options.length; // abbreviation for options.length
  int chosenOption = 0; // index of the option chosen

  // if no probs array given, assume equal probabilities
  if (probs == null) {
    probs = new float[l];

    for (int i = 0; i < l; i++)
      probs[i] = 1;
  }

  // create bounds with the prob weights to represent each option
  float probBounds[] = new float[l];    
  probBounds[0] = probs[0]; // initial bound is from 0 to probs[0]
  
  for (int i = 1; i < l; i++) 
    probBounds[i] = probBounds[i-1] + probs[i]; // each bound begins from the end of the previous bound, and lasts for the amount the option is weighted by
   
  // selects a random number within all the bounds
  float selectedNum = random(0, probBounds[l-1]);
  
  // the bound the number lies in determines the option
  for (int i = 0; i < l; i++) {
    if (selectedNum < probBounds[i]) {
      chosenOption = i;
      break;
    }
  }

  return options[chosenOption];
}

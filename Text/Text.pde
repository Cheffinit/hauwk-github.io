// Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont titleFont, footerFont, phraseFont;
color purple = #2C08FF, white = #FFFFFF, resetDefaultInk = white; // Not Night Mode Friendly
int baseSize = 50; // Base size for the text
String title = "Mr Mercer?", footer = "Best Teacher", phrase = "The";

// Animation variables
boolean isSpacePressed = false;
float titleScale = 1.0;
float phraseScale = 1.0;
float footerScale = 1.0;
color currentTitleColor, currentPhraseColor, currentFooterColor;
float animationSpeed = 0.05;

// Setup
void setup() {
  size(500, 700); // Portrait Canvas
  appWidth = width;
  appHeight = height;

  // Fonts
  titleFont = createFont("Harrington", 55);
  footerFont = createFont("Arial", 55);
  phraseFont = createFont("Playbill", 55);

  // Positions and dimensions
  titleX = appWidth * 1 / 10;
  titleY = appHeight * 1 / 10;
  titleWidth = appWidth * 8 / 10;
  titleHeight = appHeight * 1 / 10;

  superCoolPhraseX = titleX;
  superCoolPhraseY = appHeight * 4.5 / 10;
  superCoolPhraseWidth = titleWidth;
  superCoolPhraseHeight = titleHeight;

  footerX = titleX;
  footerY = appHeight * 8 / 10;
  footerWidth = titleWidth;
  footerHeight = titleHeight;
}

// Draw Loop
void draw() {
  background(0); // Black background for a modern vibe

  // Update colors and scale when spacebar is pressed
  if (isSpacePressed) {
    currentTitleColor = color(random(255), random(255), random(255));
    currentPhraseColor = color(random(255), random(255), random(255));
    currentFooterColor = color(random(255), random(255), random(255));
    titleScale += animationSpeed;
    phraseScale += animationSpeed;
    footerScale += animationSpeed;

    // Prevent text from scaling too large or too small
    if (titleScale > 2.0) titleScale = 1.0;
    if (phraseScale > 2.0) phraseScale = 1.0;
    if (footerScale > 2.0) footerScale = 1.0;
  } else {
    currentTitleColor = purple;
    currentPhraseColor = purple;
    currentFooterColor = purple;
  }

  // Calculate text size with a minimum value to avoid 0 size
  float titleSize = max(baseSize * titleScale, 1); // Ensures text size is at least 1px
  float phraseSize = max(baseSize * phraseScale, 1); // Ensures text size is at least 1px
  float footerSize = max(baseSize * footerScale, 1); // Ensures text size is at least 1px

  // Draw Rectangles (for reference)
  stroke(255);
  noFill();
  rect(titleX, titleY, titleWidth, titleHeight); // Title
  rect(superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight); // Phrase
  rect(footerX, footerY, footerWidth, footerHeight); // Footer

  // Draw Text with Animation and Color
  fill(currentTitleColor);
  textAlign(CENTER, CENTER);
  textFont(titleFont, titleSize); // Use title size with scaling
  text(title, titleX, titleY, titleWidth, titleHeight);

  fill(currentPhraseColor);
  textFont(phraseFont, phraseSize); // Use phrase size with scaling
  text(phrase, superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight);

  fill(currentFooterColor);
  textFont(footerFont, footerSize); // Use footer size with scaling
  text(footer, footerX, footerY, footerWidth, footerHeight);
}

// Detect spacebar press for animation
void keyPressed() {
  if (key == ' ') {
    isSpacePressed = !isSpacePressed; // Toggle space press state
  }
}

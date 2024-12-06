//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float MonkeyX, MonkeyY, MonkeyWidth, MonkeyHeight;
PImage picBackground, picMonkey;
int picMonkeyWidth, picMonkeyHeight;
float MonkeyX_Changed, MonkeyY_Changed;
float picMonkeyWidthChanged, picMonkeyHeightChanged;
//
void setup() {
  size( 500, 600 ); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("b.jpg");
  MonkeyX_Changed = MonkeyX = appWidth * 1/4;
  MonkeyY_Changed = MonkeyY = appHeight * 1/4;
  MonkeyWidth = appWidth * 1/2;
  MonkeyHeight = appHeight * 1/2;
  picMonkey = loadImage("b.jpg");
  picMonkeyWidthChanged = picMonkeyWidth = 860;
  picMonkeyHeightChanged = picMonkeyHeight = 529;
  //
  //Image Compression
  float biggerSide = ( picMonkeyWidth > picMonkeyHeight ) ? picMonkeyWidth : picMonkeyHeight ;
  float smallerSide = ( picMonkeyHeight < picMonkeyWidth ) ? picMonkeyHeight : picMonkeyWidth ;
  float ratio = biggerSide / smallerSide; //Ratio bigger than one, divide means smaller side, multiply means larger side
  println( "Big Side:", biggerSide, "\tSmall Side:", smallerSide, "\tRatio:", ratio );
  /* Algorithm
  - Establish Landscape or Portrait of DIV
  - Note: I always fill smaller side of DIV, then calculate larger side of DIV
  - Hardcode if ratio will be >1 or <1 ... influences * or /
  - In the image, decide if calculating the larger side or the smaller side
  */
  if ( MonkeyWidth > MonkeyHeight ) { //DIV Landscape, find larger side
    picMonkeyHeightChanged = MonkeyHeight;
    picMonkeyWidthChanged = ( picMonkeyWidth > picMonkeyHeight ) ? picMonkeyWidthChanged / ratio : picMonkeyWidthChanged * ratio;
    println( "Inside If-true:", picMonkeyWidthChanged );
  } else { //DIV Portrait
    picMonkeyWidthChanged = MonkeyWidth;
    picMonkeyHeightChanged = ( picMonkeyWidth > picMonkeyHeight ) ? picMonkeyWidthChanged / ratio : picMonkeyWidthChanged * ratio;
    println( "Inside If-false:", picMonkeyHeightChanged );
  }
  println( "Changed Width:", picMonkeyWidthChanged, "\tChanged Height:", picMonkeyHeightChanged );
  //
  //DIVs
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( MonkeyX, MonkeyY, MonkeyWidth, MonkeyHeight );
}
//
void draw() {
  //Draw Image One Time, for testing
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  image( picMonkey, MonkeyX_Changed, MonkeyY_Changed, picMonkeyWidthChanged, picMonkeyHeightChanged );
}
//
void mousePressed() {
}
//
void keyPressed() {
}
//
//End MAIN

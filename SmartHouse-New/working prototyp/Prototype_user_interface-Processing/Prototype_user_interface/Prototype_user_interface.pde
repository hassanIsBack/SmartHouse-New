//____________________________________________________Imports____________________________________________________//

import processing.serial.*;



//_________________________________________________Val Declaration_______________________________________________//

//font for displaying text
PFont f;

//our serial comunication port
Serial myPort;

boolean drawState;
boolean LEDstate;
Boolean LEDpattern;
int readVal;
int currentVal;
char charVal;




//______________________________________________________Setup_____________________________________________________//
void setup() {
  //Create window
  size(640, 360);
  
  //Define Font
  f = createFont("Arial",12,true);
  
  //set drawstate
  drawState = false;
  
  //Com Port Setup
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
}




//____________________________________________________Main Loop_________________________________________________//
void draw() {
  //Set background color
  background(127);
  
  //Display text
  showText();
  
  //Decide the color of the button
  buttonAnimation();
  
  //Establish light status
  lightStatus();
  
  //open port and read value sent from arduino
  if ( myPort.available() > 0) 
  {  // If data is available,
    readVal = myPort.read();         // read it and store it in readVal
    
    if(readVal != currentVal && readVal == 1){
    LEDstate = true;
    println("Lights are on!");
    }else{
    LEDstate = false;
    println("Lights are off!");
    }
  }
  
}

//_________________________________________________Method Declaration_________________________________________________//

void showText(){
  
  //Showing text
  textFont(f,36);
  fill(0);
  text("Lights", 150, 200);
  
  fill(0);
  text("Light Pattern", 350, 200);
}

void buttonAnimation(){
  if(drawState){
    noStroke();
    fill(0);
    ellipse(450,250, 30, 30);
    }else{
    noStroke();
    fill(255);
    ellipse(450,250, 30, 30);
    }
}

void lightStatus(){
  if(LEDstate){
  noStroke();
  fill(255);
  ellipse(200,250, 30, 30);
  }else{
    noStroke();
    fill(0);
    ellipse(200,250, 30, 30);
  }
}

void mousePressed(){
  if((mouseX >= 435 && mouseX <= 465) && (mouseY >= 235 && mouseY <= 265)){
  drawState = !drawState;
  redraw();
  
  LEDpattern = true;
  
  myPort.write(1);
  }
}
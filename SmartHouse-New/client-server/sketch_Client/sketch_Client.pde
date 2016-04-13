import processing.net.*; 
import processing.serial.*; 

Client c; 
Serial port;
String input;
// Rcircle (represents Red LED)
float RcircleX=56;
float RcircleY=46;
float RcircleRadius=30;
color initialCol = color(255, 153, 51);//color set in the begining (light orange)
color afterChange=color(255,0,0); //color change after light turned on (RED)
int colorValue = initialCol;//initialize color(light orange)
void setup() { 
  size(450, 255); 
  background(204);
  ellipseMode(RADIUS);//Cirlcle mode
  //stroke(0);
  frameRate(10); //transferring rate per seconds.
  String portNum=Serial.list()[1]; //Same port that is used in Arduino
  port = new Serial(this,portNum, 9600); //Create serial communication in the port
 
  c = new Client(this, "127.0.0.1", 12345); // Replace with your server’s IP and port
} 

void draw() {         
 
  // Receive data from server: Commented this part for future use
  //if (c.available() > 0) { 
  //  input = c.readString(); 
  //  input = input.substring(0,input.indexOf("\n"));  // Only up to the newline
  //  data = int(split(input, ' '));  // Split values into an array
  //  // Draw line using received coords
  //  stroke(0);
  //  line(data[0], data[1], data[2], data[3]); 
  //} 
  
  
fill(colorValue);//fill the cirlce with the color
ellipse(RcircleX, RcircleY, RcircleRadius,RcircleRadius);//draw circle
  
}

void mouseClicked() {
  if(dist(mouseX, mouseY, RcircleX, RcircleY)<RcircleRadius){//checking whether the mouse click is inside the circle or outside
  
if (colorValue == initialCol) {//if the color is initial color (or light orange)
colorValue = afterChange;//change the color into Red after mouse click
//turn the light oN
port.write('H'); //send a signal to Arduino that tells to switch on the light 
c.write(" RED LED ON");//send this text message to the server console and print it out


} else {
colorValue = initialCol;//otherwise set the color as it was
port.write('L');  //send a signal to Arduino that tells to switch OFF the light 
c.write(" RED LED OFF");//send this text message to the server console and print it out
}
  }
}
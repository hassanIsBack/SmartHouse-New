
import processing.net.*;

Server s; 
Client c;
String input;
void setup() { 
  //size(450, 255);
  //background(204);
 frameRate(10); 
  s = new Server(this, 12345);  // Start a simple server on a port
} 
void draw() { 

  c = s.available();
  if (c != null) {
    input = c.readString(); 
    println(input);
 }
}
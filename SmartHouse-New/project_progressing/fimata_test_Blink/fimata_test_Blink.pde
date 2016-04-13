import processing.serial.*;
import cc.arduino.*;

int ledPin = 8;

Arduino arduino;

void setup(){
  
  arduino = new Arduino(this, Arduino.list()[1],57600);

  arduino.pinMode(ledPin,Arduino.OUTPUT);
}

void draw(){
  
  arduino.digitalWrite(ledPin,Arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(ledPin,Arduino.LOW);
  delay(1000);

}
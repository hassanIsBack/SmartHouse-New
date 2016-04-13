//4 leds
const int WLED = 11;
const int GLED = 10;
const int YLED = 9;
const int RLED = 8;

const int switchPin = 4;

int buttonState;
boolean LEDstate;
boolean LEDpattern;
boolean isBlinking;
int buttonStateOld;

int inByte = 0;

void setup() {
  // put your setup code here, to run once:

  //define variables
  LEDpattern = false;
  isBlinking = false;

  //Begin serial port updating
  Serial.begin(9600);

  //initializing the LEDs
  pinMode(WLED, OUTPUT);
  pinMode(GLED, OUTPUT);
  pinMode(YLED, OUTPUT);
  pinMode(RLED, OUTPUT);

  pinMode(switchPin, INPUT);

  //establishContact();
}

void loop() {

  if (Serial.available() > 0) {
    // read the incoming byte:
    inByte = Serial.read();
    if (inByte == 1) LEDpattern = !LEDpattern;

  }

  if (digitalRead(switchPin) != buttonState) {

    // check if the switch is flipped.
    // if it is, the buttonState is HIGH:
    if (buttonState == HIGH) {
      if (LEDpattern) {
        isBlinking = true;
        //Serial.println("Lights on");
        Serial.write(1);
      } else {
        isBlinking = false;
        lightsOn();
        Serial.write(1);
      }
    }
    else {
      lightsOff();
      isBlinking = false;
      //Serial.println("Lights off");
      Serial.write(0);
    }
    // read the state of the pushbutton value:
    buttonState = digitalRead(switchPin);
  }

  if (isBlinking) {
    blinking();
  }
}

void blinking() {
  digitalWrite(WLED, HIGH);
  digitalWrite(GLED, HIGH);
  digitalWrite(YLED, HIGH);
  digitalWrite(RLED, HIGH);
  delay(100);
  digitalWrite(WLED, LOW);
  digitalWrite(GLED, LOW);
  digitalWrite(YLED, LOW);
  digitalWrite(RLED, LOW);
  delay(100);
}

void lightsOn() {
  // turn LED on:
  digitalWrite(WLED, HIGH);// turn the LED off by making the voltage LOW
  digitalWrite(GLED, HIGH);
  digitalWrite(YLED, HIGH); // turn the LED on (HIGH is the voltage level)
  digitalWrite(RLED, HIGH);
  Serial.print("Lights ON");
}

void lightsOff() {
  // turn LED off:
  digitalWrite(WLED, LOW);// turn the LED off by making the voltage LOW
  digitalWrite(GLED, LOW);
  digitalWrite(YLED, LOW); // turn the LED on (HIGH is the voltage level)
  digitalWrite(RLED, LOW);
  Serial.print("Lights OFF");
}

/////__________________________________Utilities______________________________________///

void establishContact() {

  while (Serial.available() <= 0) {
    Serial.println("A");   // send a capital A
    delay(300);
  }
}

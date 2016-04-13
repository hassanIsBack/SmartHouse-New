import processing.net.*; 
import processing.serial.*;
import cc.arduino.*;

//Device declaration
Device_ lamp;
Device_ coffeeMachine;
Device_ thermometer;

//Declaring our serial port
Serial port;

//Arduino board declaration
Arduino arduino;

//Variable declaration/definition
int ledPin = 8;
int ledPin2 = 11;
int ledPin3 = 12;
int ledPin4 = 13;
int therm = 1;
float temp = 0;
String temp_url;
//TODO
//All variables that we need should bee listed here ASAP


void setup() { 
  
  //Display size
  size(640, 360);
  
   //Device Definitions
  lamp = new Device_("Lamp", 1, 100,200);
  coffeeMachine = new Device_("Coffee", 1, 450,200);
  thermometer = new Device_("Temperature", 2, 225,200);
  
  //TODO
  //Create an array for GUI devices
  
  //Arduino Definition
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  
  //Set pinmodes
  arduino.pinMode(ledPin,Arduino.OUTPUT);
  arduino.pinMode(ledPin2,Arduino.OUTPUT);
  arduino.pinMode(ledPin3,Arduino.OUTPUT);
  arduino.pinMode(ledPin4,Arduino.OUTPUT);
  
  //TODO
  //Create method to define all pinmodes
  
} 

void draw() {  
  
  //Set background color
  background(127);  
  
  //Load information from website/server into an array of strings
  String []json=loadStrings("https://thesmarthouse.azurewebsites.net/restAPI/Room/1");
  
  //delay
   delay(1000);
   
  //Read input from analog pins on our arduino
  checkSensors();
  
  //Check to see if there was information sent from server
  if (json!=null) {
    
    //if so, save array of string information to file
    saveStrings("data.json", json);
    
    //Load json object
    JSONObject js= loadJSONObject("data.json");
    JSONObject room = js.getJSONObject("Room");
    JSONArray values = room.getJSONArray("devices");
    
    //Cycle through Devices
    for (int i = 0; i < values.size(); i++) {
  
      //Create json object and fill it with information from current device
      JSONObject jobj = values.getJSONObject(i); 

      //Extract and seperate information on current device 
      int id = jobj.getInt("id");
      String devices = jobj.getString("name");
      String stat = jobj.getString("status");
      
      //Check to see if current device is a "the lamp"
      if (devices.equals("Lamp")==true) {
        stat = jobj.getString("status");
        
        //if statement to check status of device. i.e. if the lamp is ON
        if (stat.equals("ON")==true) {
          
          //Turn Lamp on
          
          //update status of GUI element that represents the lamp
          lamp.setStatus(true);
          
        } else {
          
          //Turn Lamp off
          //update status of GUI element that represents the lamp
          lamp.setStatus(false);
          
        }
        
      }

       //Check if current device is the coffe machine
       if(devices.equals("Coffee Machine")==true){
        stat = jobj.getString("status");
        
        //if statement to check status of device. i.e. if the Coffe machine is ON
        if (stat.equals("ON")==true) {

          //update status of GUI element that represents the Coffee Machine
          coffeeMachine.setStatus(true);
        } else {
  
          //update status of GUI element that represents the Coffee Machine
          coffeeMachine.setStatus(false);
        }
      }
      
      //Print the device information to the console
      println(id + ", " + devices + ", " + stat);
      
      //printing the temperature, read by from the arduino, to the console
      println("temperature is " +temp);
      thermometer.updateStatus(temp);
      //CAN THE THERMOMETER INFORMATION BE PUT OUTSIDE OF THE FOR LOOP? 
      //IT FEELS UNECESSARY TO HAVE THIS IN THE FOR LOOP/Paul
    }
  }
  
  //updates what is shown on screen
  lamp.drawStatus();
  coffeeMachine.drawStatus();
  thermometer.drawStatus();
  //TODO
  //Put this in a method
}

//_______________________METHOD DECLARATION/DEFINITION___________________________//

void checkSensors(){

  //Readinput from thermometer(photosensor on prototype)
  //THE OUTPUT OF THIS SEEMS A BIT FUNKY. ANY IDEAS?
  temp = arduino.analogRead(therm) * 0.48828125;
  //Update temperature reading in gui
  thermometer.updateStatus(temp);
  
  //Upload Temperature to Server
  temp_url="https://thesmarthouse.azurewebsites.net/restAPI/Device/updateTemp/"+temp+"/1";
  loadStrings(temp_url);//Im not quite sure where this string is being loaded to/Paul
  
}

void SetLEDs(boolean _status){
  
  if(_status){
    
    //Turn ledPin on
    arduino.digitalWrite(ledPin,Arduino.HIGH);
    arduino.digitalWrite(ledPin2,Arduino.HIGH);
    arduino.digitalWrite(ledPin3,Arduino.LOW);
    arduino.digitalWrite(ledPin4,Arduino.HIGH);
  
  } else {
  
    //Turn ledPin off
    arduino.digitalWrite(ledPin,Arduino.HIGH);
    arduino.digitalWrite(ledPin2,Arduino.HIGH);
    arduino.digitalWrite(ledPin3,Arduino.HIGH);
    arduino.digitalWrite(ledPin4,Arduino.HIGH);
          
  
  }
}
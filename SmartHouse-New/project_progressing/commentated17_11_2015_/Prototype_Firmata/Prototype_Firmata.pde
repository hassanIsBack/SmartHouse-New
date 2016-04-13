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
//All variables that we need should be listed here ASAP


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
  
  //Set pinModes
  setPins();
  
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
      
      //Here we now use the ID of the device instead of the name. 
    switch(id){
      //Device ID = 1 - Outdoor Lamp
      case 1:
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Lamp on
          setLEDs(true);
          //update status of GUI element that represents the lamp
          lamp.setStatus(true);
          
        } else {
          
          //Turn Lamp off
          setLEDs(false);
          //update status of GUI element that represents the lamp
          lamp.setStatus(false);
          
        }
        
      break;
      
      case 2:
      //Device ID = 2 - Timer
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Timer on
         
          //update status of GUI element that represents the Timer
          
          
        } else {
          
          //Turn Timer off
          
          
          //update status of GUI element that represents the Timer
          
          
        }
        
      break;
      
      case 3:
      //Device ID = 3 - Heater
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Heater on
         
          //update status of GUI element that represents the Heater
          
          
        } else {
          
          //Turn Heater off
          
          
          //update status of GUI element that represents the Heater
          
          
        }
     
      break;
      
      case 4:
      //Device ID = 4 - Heater(Vind)
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Heater(Vind) on
         
          //update status of GUI element that represents the Heater(Vind)
          
          
        } else {
          
          //Turn Heater(Vind) off
          
          
          //update status of GUI element that represents the Heater(Vind)
          
          
        }
        
      break;
      
      case 5:
      //Device ID = 5 - Burglar alarm
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Burglar alarm on
         
          //update status of GUI element that represents the Burglar alarm
          
          
        } else {
          
          //Turn Burglar alarm off
          
          
          //update status of GUI element that represents the Burglar alarm
          
          
        }
      break;
      
      case 6:
      //Device ID = 6 - Indoor Lamp
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Indoor Lamp on
         
          //update status of GUI element that represents the Indoor Lamp
          
          
        } else {
          
          //Turn Indoor Lamp off
          
          
          //update status of GUI element that represents the Indoor Lamp
          
          
        }

      break;
      
      case 7:
      //Device ID = 7 - Timer 2
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Timer on
         
          //update status of GUI element that represents the Timer
          
          
        } else {
          
          //Turn Timer off
          
          
          //update status of GUI element that represents the Timer
          
          
        }
      break;
      
      case 8:
      //Device ID = 8 - Speaker
      //Check status
      if (stat.equals("ON")) {
          
          //Turn Speaker on
         
          //update status of GUI element that represents the Speaker
          
          
        } else {
          
          //Turn Speaker off
          
          
          //update status of GUI element that represents the Speaker
          
          
        }
      break;
      
      case 9:
      //Device ID = 9 - VM 1
      //Check status
      if (stat.equals("ON")) {
          
          //update status of GUI element that represents the VM 1

        } else {
          
          //update status of GUI element that represents the VM 1
          
          
        }
      break;
      
      case 10:
      //Device ID = 10 - VM 2
      //Check status
      if (stat.equals("ON")) {
         
          //update status of GUI element that represents the VM
          
          
        } else {
          
          //update status of GUI element that represents the VM
          
          
        }
      break;
      
      //Device ID = 11 - VM3 coffe machine
      case 11:
      
      //Check status
      if(devices.equals("Coffee Machine")==true){
        
        //if statement to check status of device. i.e. if the Coffe Machine is ON
        if (stat.equals("ON")==true) {

          //update status of GUI element that represents the Coffee Machine
          coffeeMachine.setStatus(true);
        } else {
  
          //update status of GUI element that represents the Coffee Machine
          coffeeMachine.setStatus(false);
        }
      }

      break;
    } //End of switch-case
      
      //Print the device information to the console
      println(id + ", " + devices + ", " + stat);
      
      //printing the temperature, read by from the arduino, to the console
      println("temperature is " +temp);
      thermometer.updateStatus(temp);
      //CAN THE THERMOMETER INFORMATION BE PUT OUTSIDE OF THE FOR-LOOP? 
      //IT FEELS UNECESSARY TO HAVE THIS IN THE FOR-LOOP/Paul
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

void setPins(){
  
  //Set pinmodes
  arduino.pinMode(ledPin,Arduino.OUTPUT);
  arduino.pinMode(ledPin2,Arduino.OUTPUT);
  arduino.pinMode(ledPin3,Arduino.OUTPUT);
  arduino.pinMode(ledPin4,Arduino.OUTPUT);
  
}

void setLEDs(boolean _status){
  
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

void setLogic(int b0,int b3,int b4,int b5,boolean _status){
  
  //This is for figuring out how we are going to pass the logic decided by the Switch-case in the main loop
 
}
class Device_{
  
  //___________________________________Variable Declaration___________________________________//
  PFont f;
  int xPos, yPos, type;
  float val;
  String name;
  boolean stat;
  
  //The Constructor
  Device_(String _name,int _type, int _xPos, int _yPos){
 
    //Define the values of our variables
    name = _name;
    type = _type;
    xPos = _xPos;
    yPos = _yPos;
    stat = false;
    
    //Creat font for the text. this is used to define how the text will look
    f = createFont("Arial",12,true);
    
    //Check the type of our Device_ object
    //I THINK THIS WILL BE CHANGED, I HAVNT GOT AROUND TO IT, LOL/Paul
    switch(type){
      case 1:
        drawStatus();
        break;
      case 2:
        updateStatus(0);
        break;
        default:
        println("invalid type");
    }
    
  }
  
  void drawStatus(){
    //text
    textFont(f,36);
    fill(0);
    text(name, xPos, yPos);
    
    //If statement to see if the device being updated is a button or not(Lamp, coffee, etc)
    if(type == 1){
  
  //Decides if buttons should be filled in or not.
      if(stat){
        //If true then fill Button white
        noStroke();
        fill(255);
        ellipse(xPos + 50,yPos + 50, 30, 30);
      }else{
        //if not, fill button black
        noStroke();
        fill(0);
        ellipse(xPos + 50,yPos + 50, 30, 30);
      }
    
    }else{
      
      //Update Text devices(temperature)
      textFont(f,36);
      fill(0);
      text(val, xPos + 50, yPos + 50);
  }
  
  }
  
  
  void updateStatus(float _val){
    
    //new value to display
    val = _val;
    
  }
  
  //Set the status of the button of THIS object
  void setStatus(boolean newState){
  
    //Change state boolean
    stat = newState;
    
    //update GUI
    drawStatus();
    
  }

}
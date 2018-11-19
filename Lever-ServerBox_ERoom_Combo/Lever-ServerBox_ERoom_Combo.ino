//www.elegoo.com
//2016.12.08
/*****************************************/

//Tilt Sensor Stuff
const int ledPin = 13;//the led attach to
bool leverPulled = false;
bool serverPulled = false;

//Distance Sensor Stuff
// defines pins numbers
const int trigPin = 9;
const int echoPin = 10;
const int tiltPin = 3;
// defines variables
long duration;
int distance;

void setup()
{ 
  //Lever
  pinMode(ledPin,OUTPUT);//initialize the ledPin as an output
  pinMode(tiltPin,INPUT);
  digitalWrite(tiltPin, HIGH);
  Serial.begin(115200);

  //Server
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  
} 
/******************************************/
void loop() 
{  
  int digitalVal = digitalRead(tiltPin);
  if(LOW == digitalVal)
  {
    if (!leverPulled){
      Serial.println("LLLLLLLLLLL");
      leverPulled = true;  
    }
  }
  

  

  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance= duration*0.034/2;
  // Prints the result on the serial monitor
  if (distance > 10){
    if (!serverPulled && leverPulled){
      Serial.println("SSSSSSSSSSS");
      serverPulled = true;
    }
  }
}
/**********************************************/

//light stuff
//led pins for light sensor
#define GREEN 10
#define BLUE 11
#define RED 12
#define LED 13

//Calibrations for light sensors
int left_cal=250;
int right_cal=250;
int center_cal=250;

int left_light;
int right_light;  
int center_light;

char code[4];

bool leverPulled = false;
bool serverPulled = false;
bool lightSensor = false;


//Distance Sensor Stuff
// defines pins numbers
const int trigPin = 6;
const int echoPin = 7;
const int tiltPin = 3;
// defines variables
long duration;
int distance;


void setup() {
  pinMode(GREEN, OUTPUT);
  pinMode(BLUE,OUTPUT);
  pinMode(RED, OUTPUT);
  pinMode(LED,OUTPUT);
  //run once with serial moniter on to find baseline light levels and set these
  //a little higher so flashlights will set them off
  //
  //Lever
  //pinMode(ledPin,OUTPUT);//initialize the ledPin as an output
  pinMode(tiltPin,INPUT);
  digitalWrite(tiltPin, HIGH);
  Serial.begin(115200);

  //Server
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

}

void print_calibrations(){
  Serial.write("center: ");
  Serial.println(center_light);
  Serial.write("right: ");
  Serial.println(right_light);
  Serial.write("left: ");
  Serial.println(left_light);
  
}

bool is_order(char code[4])
{
  //Set this to the vaule you want for the combo lock
  //c=center, r=right l=left, use lowercase
  char ans[4]="rclc";
  
  bool ret=false;
  
  for(int i=0;i<4;i++)
  {
    if(code[i]!=ans[i])
    {
      ret=false;
      Serial.print(i);
      Serial.print(code[i]);
      Serial.println(ans[i]);
      break;
    }
    else ret=true;    
  }
  
  return ret;
}

char censor_check()
{
  char ans;
  if(left_light > left_cal){
    ans='l';
    digitalWrite(GREEN,HIGH);
    delay(500);
    digitalWrite(GREEN,LOW);
  }
  else if(right_light > right_cal){
    ans='r';
    digitalWrite(BLUE,HIGH);
    delay(500);
    
    digitalWrite(BLUE,LOW);
  }
  else if(center_light > center_cal){
    ans='c';
    digitalWrite(RED,HIGH);
    delay(500);
    digitalWrite(RED,LOW);
    
  }
  else ans='f';
  delay(1500);
  return ans;
}

bool tilt_sensor()
{
  bool ans=false;
  int digitalVal = digitalRead(tiltPin);
  if(LOW == digitalVal)
  {
    if (!leverPulled){
      Serial.println("LLLLLLLLLLL");
      ans = true;  
    }
  }
  return ans;
}

bool echo_sensor()
{
   bool ans =false;
   
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
  Serial.println(distance);
  
  if (distance > 10 && distance <500){
    if (!serverPulled && leverPulled){
      Serial.println("SSSSSSSSSSS");
      serverPulled = true;
      ans=true;
    }
  }
  return ans;
}

bool light_sensor()
{
  bool ans=false;
  left_light = analogRead(A0);
  center_light=analogRead(A1);
  right_light = analogRead(A2);
  
  
  //this will print the current values for light sensor
  print_calibrations();
  
  for(int i=0;i<4;++i)
  {
    code[i]=censor_check();
    delay(1500);
    /*
    while(code[i]=='f')
    {
      code[i]=censor_check();    
    }
    */    
  }
  if(is_order(code)==true)
  {
    digitalWrite(LED,HIGH);
    ans=true;
    //Serial.write("Code is true");
  }
  return ans;
 }



void loop() {  
  
  while(leverPulled==false)
  {
    leverPulled=tilt_sensor();
  }
  while(serverPulled==false)
  {
    serverPulled=echo_sensor();
  }



  //light sensor demo
  while(lightSensor==false)
  {    
    light_sensor(); 
  }
}

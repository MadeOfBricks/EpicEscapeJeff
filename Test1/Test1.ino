const int led = 3;

 int state=0;  

void setup()   

{   

    Serial.begin(115200); //Starts the serial connection with 115200 Buad Rate   

    pinMode(led, OUTPUT); //Sets led pin as an output

    Serial.write("Test");//Send "ALL ABOUT CIRCUITS!" to the PC

}   

void loop()   {
  delay(1000);
  Serial.write("Test");
  delay(1000);
  Serial.write("ReTest");
  
} 

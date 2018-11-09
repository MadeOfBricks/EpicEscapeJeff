//For teting light per side

#define GREEN 7
#define BLUE 10
#define RED 8
#define LED 13
int left_cal=250;
int right_cal=250;
int center_cal=250;

int left_light;
int right_light;  
int center_light;

char code[4];


void setup() {
  pinMode(GREEN, OUTPUT);
  pinMode(BLUE,OUTPUT);
  pinMode(RED, OUTPUT);
  pinMode(LED,OUTPUT);
  //run once with serial moniter on to find baseline light levels and set these
  //a little higher so flashlights will set them off
  //



  

  Serial.begin(9600);

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
  char ans[4]="rrrr";
  
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

void loop() {  
  
  left_light = analogRead(A0);
  right_light = analogRead(A2);
  center_light=analogRead(A1);
  
  //this will print the current values for light sensor
  print_calibrations();
  
  for(int i=0;i<4;++i){
    code[i]=censor_check();
    delay(1500);
    /*
    while(code[i]=='f')
    {
      code[i]=censor_check();    
    }
    */    
  }
  if(is_order(code)==true){
    digitalWrite(LED,HIGH);
    Serial.write("Code is true");
  }
}
  

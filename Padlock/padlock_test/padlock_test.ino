//For teting light per side

#define GREEN 9
#define BLUE 7
#define RED 4
#define LED 3
int left_light;
int right_light;
int center_light;
int left_cal;
int right_cal;
int center_cal;
char code[4];



void setup() {
  pinMode(GREEN, OUTPUT);
  pinMode(BLUE,OUTPUT);
  pinMode(RED, OUTPUT);
  pinMode(LED,OUTPUT);
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
  //this is the code you want
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
  if(left_light <150){
    ans='l';
    digitalWrite(GREEN,HIGH);
    delay(250);
    digitalWrite(GREEN,LOW);
  }
  else if(right_light<150){
    ans='r';
    digitalWrite(BLUE,HIGH);
    delay(250);
    
    digitalWrite(BLUE,LOW);
  }
  else if(center_light<150){
    ans='c';
    digitalWrite(RED,HIGH);
    delay(250);
    
  }
  else ans='f';
  delay(1500);
  return ans;
}

void loop() {  
  
  left_light = analogRead(A0);
  right_light = analogRead(A1);
  center_light=analogRead(A2);
  print_calibrations();
  
  for(int i=0;i<4;++i){
    code[i]=censor_check();
    
    digitalWrite(GREEN,LOW);
    digitalWrite(RED,LOW);
    while(code[i]=='f')
    {
      code[i]=censor_check();    
    }    
  }
  if(is_order(code)==true){
    digitalWrite(LED,HIGH);
    Serial.write("Code is true");
  }
}
  

//For teting light per side

#define GREEN 9
#define BLUE 7
#define RED 4
int left_light;
int right_light;
bool inOrder=false;
bool left1=false;
bool right1=false;
bool left2=false;
bool right2=false;
int combo=0;


void setup() {
  // put your setup code here, to run once:
  pinMode(GREEN, OUTPUT);
  pinMode(BLUE,OUTPUT);
  pinMode(RED, OUTPUT);
  Serial.begin(9600);

}

void loop() {

  left_light = analogRead(A0);
  right_light = analogRead(A1);

  //check 1st input
  if(combo==0 && left_light > 150){
    left1=true;
    combo=1;
    digitalWrite(GREEN,HIGH);
  }
  //check 2nd input
  if(combo==1){
    //check for false before true
    if(left_light >150){
      left1=false;
      combo=0;
    }
    if(right_light >150 &&combo==1){
      right1=true;
      combo=2;
      digitalWrite(BLUE,HIGH);
    }
  }
//check 3rd input
  if(combo==2){
    if(right_light >150){
      left1=false;
      right1=false;
      combo=0;
    }
    if(left_light >150&&combo==2){
      left2=true;
      combo=3;
      digitalWrite(GREEN,HIGH);
    }    
  }
  //check 4th input
  if(combo==3){
    if(left_light>150){
      left1=false;
      left2=false;
      right1=false;
      combo=0;
    }
    if(right_light>150&&combo==3){
      right2=true;
      combo=4;
      digitalWrite(BLUE,HIGH);
    }
  }
  //check if combo is finshed
  if(combo=4){
    if(left1==true && left2==true &&right1==true &&right2==true){
      inOrder=true;
    }
  }
  if(inOrder==true) digitalWrite(RED, HIGH);
  //delay xsec where 1sec=1000 between each check
  delay(3000);

  
    
  
 

  
 /*

  if(left_light < 150){
    if(left1==false){
      left1=true;    
    }
    if(left1==true && right1==true) {
      left2=true;
      
    }
    digitalWrite(GREEN,HIGH);
  }
  else digitalWrite(GREEN,LOW);

  if(right_light < 150){
      if(right1==false)right1=true;
      if(right1==true && left2==true) {
        right2=true;
        Serial.println(right2);
      }
    
    
    digitalWrite(BLUE,HIGH);
  }
  else digitalWrite(BLUE,LOW);

  
  if(left1=true && right1==true && left2==true && right2==true) inOrder=true;
  if(inOrder==true) digitalWrite(RED, HIGH);
  */
  //delay(2000);
}
  

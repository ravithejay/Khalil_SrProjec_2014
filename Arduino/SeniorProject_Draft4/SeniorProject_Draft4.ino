// REMIXED BY: TECHBITAR (HAZIM BITAR)
// LICENSE: PUBLIC DOMAIN
// DATE: MAY 2, 2012
// CONTACT: techbitar at gmail dot com
//#include <SoftwareSerial.h>// import the serial library
byte byte1,byte2, byte3;
char  LED = 13; // LED on pin 13
//SoftwareSerial Genotronex(10,11);
int brightness = 0;
int bright1,bright2,bright3,bright4,bright5,bright6,bright7,bright8,bright9,bright10,bright11,bright12,bright13;
int start13 = 0;
int start12 = 0;
int start11 = 0;
int start10 = 0;
int start9 = 0;
int start8 = 0;
int start7 = 0;
int start6 = 0;
int start5 = 0;
int start4 = 0;
int start3 = 0;
int start2 = 0;
int start1 = 0;
int start0 = 0;

//Enter the brightnness for the analog pins. The numbers at the end of the variable refer to the port 
int brightn2 = 26;
int brightn3= 51;
int brightn4 = 77;
int brightn5 = 102;
int brightn6 = 128;
int brightn7 = 153;
int brightn8 = 179;
int brightn9 = 204;
int brightn10 = 230;
int brightn11 = 255;
int brightn12 = 26;
int brightn13 = 51;

//Enter the amount of cycles you want the On/Off periods to repeat
int cycles = 1;
int t_total = 1260+420;

//Enter the time on in seconds for each port output
int ton2 = 720+180;
int ton3 = 720+180;
int ton4 = 720+180;
int ton5 = 720+180;
int ton6 = 720+180;
int ton7 = 720+180;
int ton8 = 720+180;
int ton9 = 720+180;
int ton10 = 720+180;
int ton11 = 720+180;
int ton12 = 720+180;
int ton13 = 720+180;
int ton22 = 180;
int ton23 = 360+60;
int ton24 = 480+120;
int ton25 = 720+180;
int ton26 = 960+240;
int ton27 = 1080+360;
int ton28 = 1200+420;
int ton29 = 0;
int ton30 = 0;
int ton31 = 0;
int ton32 = 1200+420;
int ton33 = 1200+420;
int ton34 = 1200+420;
int ton35 = 0;
int ton36 = 1200+420;
int ton37 = 1200+420;
int ton38 = 1200+420;
int ton39 = 0;
int ton40 = 1200+420;
int ton41 = 1200+420;



int a[2][32] = {{ton2,ton3,ton4,ton5,ton6,ton7,ton8,ton9,ton10,ton11,ton12,ton13,ton22,ton23,ton24,ton25,ton26,ton27,ton28,ton29,ton30,ton31,ton32,ton33,ton34,ton35,ton36,ton37,ton38,ton39,ton40,ton41}, 
                {2,3,4,5,6,7,8,9,10,11,12,13,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41}};

int i, j, k, temp, temp1;















void delay_sec(int sec) {
  for(int p=0; p<sec; p++) {
    delay(1000);
  }
}

void setup() {
  Serial.begin(9600); 
  pinMode(LED, OUTPUT);
  pinMode(12,OUTPUT);pinMode(11,OUTPUT);pinMode(10,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(2,OUTPUT);
  pinMode(22, OUTPUT);
  pinMode(23, OUTPUT);
  pinMode(24, OUTPUT);
  pinMode(25, OUTPUT);
  pinMode(26, OUTPUT);
  pinMode(27, OUTPUT);
  pinMode(28, OUTPUT);
  pinMode(29, OUTPUT);
  pinMode(30, OUTPUT);
  pinMode(31, OUTPUT);
  pinMode(32, OUTPUT);
  pinMode(33, OUTPUT);
  pinMode(34, OUTPUT);
  pinMode(35, OUTPUT);
  pinMode(36, OUTPUT);
  pinMode(37, OUTPUT);
  pinMode(38, OUTPUT);
  pinMode(39, OUTPUT);
  pinMode(40, OUTPUT);
  pinMode(41, OUTPUT);

  
  Serial.println("Select the Channel you want to edit (2-13) [10 =a] [11=b] [12=c] [13=d]");
}

void loop() {
  //Genotronex.available()>2
  if (Serial.available()){  // stay here so long as COM port is empty   
    byte1 = Serial.read();
    delay(5);
    byte2 = Serial.read();
    delay(5);
    byte3 = Serial.read();
    
if (byte1 =='1' && byte2 == '3' && byte3 == '0' ){
bright13 =0;}
if (byte1 =='1' && byte2 == '3' && byte3 == '1' ){
bright13 =25;}
if (byte1 =='1' && byte2 == '3' && byte3 == '2' ){
bright13=51;}
if (byte1 =='1' && byte2 == '3' && byte3 == '3' ){
bright13 =77;}
if (byte1 =='1' && byte2 == '3' && byte3 == '4' ){
bright13= 102; }
if (byte1 =='1' && byte2 == '3' && byte3 == '5' ){
bright13= 128; }
if (byte1 =='1' && byte2 == '3' && byte3 == '6' ){
bright13 = 153;}
if (byte1 =='1' && byte2 == '3' && byte3 == '7' ){
bright13 =179;}
if (byte1 =='1' && byte2 == '3' && byte3 == '8' ){
bright13 =204;}
if (byte1 =='1' && byte2 == '3' && byte3 == '9' ){
bright13=230;}
if (byte1 =='1' && byte2 == '3' && byte3 == 'a' ){
bright13=255;}
if (byte1 == '1' && byte2 == '3' && byte3 == 'o')
{start13 = 1;}
if (byte1 == '1' && byte2 == '3' && byte3 == 'f')
{start13 = 0;}
  
 
if (byte1 =='1' && byte2 == '2' && byte3 == '0' ){
bright12 =0;}
if (byte1 =='1' && byte2 == '2' && byte3 == '1' ){
bright12 =25;}
if (byte1 =='1' && byte2 == '2' && byte3 == '2' ){
bright12=51;}
if (byte1 =='1' && byte2 == '2' && byte3 == '3' ){
bright12 =77;}
if (byte1 =='1' && byte2 == '2' && byte3 == '4' ){
bright12= 102; }
if (byte1 =='1' && byte2 == '2' && byte3 == '5' ){
bright12= 128; }
if (byte1 =='1' && byte2 == '2' && byte3 == '6' ){
bright12 = 153;}
if (byte1 =='1' && byte2 == '2' && byte3 == '7' ){
bright12 =179;}
if (byte1 =='1' && byte2 == '2' && byte3 == '8' ){
bright12 =204;}
if (byte1 =='1' && byte2 == '2' && byte3 == '9' ){
bright12=230;}
if (byte1 =='1' && byte2 == '2' && byte3 == 'a' ){
bright12=255;}
if (byte1 == '1' && byte2 == '2' && byte3 == 'o')
{start12 = 1;}
if (byte1 == '1' && byte2 == '2' && byte3 == 'f')
{start12 = 0;}

if (byte1 =='1' && byte2 == '1' && byte3 == '0' ){
bright11 =0;}
if (byte1 =='1' && byte2 == '1' && byte3 == '1' ){
bright11 =25;}
if (byte1 =='1' && byte2 == '1' && byte3 == '2' ){
bright11=51;}
if (byte1 =='1' && byte2 == '1' && byte3 == '3' ){
bright11 =77;}
if (byte1 =='1' && byte2 == '1' && byte3 == '4' ){
bright11= 102; }
if (byte1 =='1' && byte2 == '1' && byte3 == '5' ){
bright11= 128; }
if (byte1 =='1' && byte2 == '1' && byte3 == '6' ){
bright11 = 153;}
if (byte1 =='1' && byte2 == '1' && byte3 == '7' ){
bright11 =179;}
if (byte1 =='1' && byte2 == '1' && byte3 == '8' ){
bright11 =204;}
if (byte1 =='1' && byte2 == '1' && byte3 == '9' ){
bright11=230;}
if (byte1 =='1' && byte2 == '1' && byte3 == 'a' ){
bright11=255;}
if (byte1 == '1' && byte2 == '1' && byte3 == 'o')
{start11 = 1;}
if (byte1 == '1' && byte2 == '1' && byte3 == 'f')
{start11 = 0;}

if (byte1 =='1' && byte2 == '0' && byte3 == '0' ){
bright10 =0;}
if (byte1 =='1' && byte2 == '0' && byte3 == '1' ){
bright10 =25;}
if (byte1 =='1' && byte2 == '0' && byte3 == '2' ){
bright10=51;}
if (byte1 =='1' && byte2 == '0' && byte3 == '3' ){
bright10 =77;}
if (byte1 =='1' && byte2 == '0' && byte3 == '4' ){
bright10= 102; }
if (byte1 =='1' && byte2 == '0' && byte3 == '5' ){
bright10= 128; }
if (byte1 =='1' && byte2 == '0' && byte3 == '6' ){
bright10 = 153;}
if (byte1 =='1' && byte2 == '0' && byte3 == '7' ){
bright10 =179;}
if (byte1 =='1' && byte2 == '0' && byte3 == '8' ){
bright10 =204;}
if (byte1 =='1' && byte2 == '0' && byte3 == '9' ){
bright10=230;}
if (byte1 =='1' && byte2 == '0' && byte3 == 'a' ){
bright10=255;}
if (byte1 == '1' && byte2 == '0' && byte3 == 'o')
{start10 = 1;}
if (byte1 == '1' && byte2 == '0' && byte3 == 'f')
{start10 = 0;}



if (byte1 =='0' && byte2 == '9' && byte3 == '0' ){
bright9 =0;}
if (byte1 =='0' && byte2 == '9' && byte3 == '1' ){
bright9 =25;}
if (byte1 =='0' && byte2 == '9' && byte3 == '2' ){
bright9=51;}
if (byte1 =='0' && byte2 == '9' && byte3 == '3' ){
bright9 =77;}
if (byte1 =='0' && byte2 == '9' && byte3 == '4' ){
bright9= 102; }
if (byte1 =='0' && byte2 == '9' && byte3 == '5' ){
bright9= 128; }
if (byte1 =='0' && byte2 == '9' && byte3 == '6' ){
bright9 = 153;}
if (byte1 =='0' && byte2 == '9' && byte3 == '7' ){
bright9 =179;}
if (byte1 =='0' && byte2 == '9' && byte3 == '8' ){
bright9 =204;}
if (byte1 =='0' && byte2 == '9' && byte3 == '9' ){
bright9=230;}
if (byte1 =='0' && byte2 == '9' && byte3 == 'a' ){
bright9=255;}
if (byte1 == '0' && byte2 == '9' && byte3 == 'o')
{start9 = 1;}
if (byte1 == '0' && byte2 == '9' && byte3 == 'f')
{start9 = 0;}

if (byte1 =='0' && byte2 == '8' && byte3 == '0' ){
bright8 =0;}
if (byte1 =='0' && byte2 == '8' && byte3 == '1' ){
bright8 =25;}
if (byte1 =='0' && byte2 == '8' && byte3 == '2' ){
bright8=51;}
if (byte1 =='0' && byte2 == '8' && byte3 == '3' ){
bright8 =77;}
if (byte1 =='0' && byte2 == '8' && byte3 == '4' ){
bright8= 102; }
if (byte1 =='0' && byte2 == '8' && byte3 == '5' ){
bright8= 128; }
if (byte1 =='0' && byte2 == '8' && byte3 == '6' ){
bright8 = 153;}
if (byte1 =='0' && byte2 == '8' && byte3 == '7' ){
bright8 =179;}
if (byte1 =='0' && byte2 == '8' && byte3 == '8' ){
bright8 =204;}
if (byte1 =='0' && byte2 == '8' && byte3 == '9' ){
bright8=230;}
if (byte1 =='0' && byte2 == '8' && byte3 == 'a' ){
bright8=255;}
if (byte1 == '0' && byte2 == '8' && byte3 == 'o')
{start8 = 1;}
if (byte1 == '0' && byte2 == '8' && byte3 == 'f')
{start8 = 0;}

if (byte1 =='0' && byte2 == '7' && byte3 == '0' ){
bright7 =0;}
if (byte1 =='0' && byte2 == '7' && byte3 == '1' ){
bright7 =25;}
if (byte1 =='0' && byte2 == '7' && byte3 == '2' ){
bright7=51;}
if (byte1 =='0' && byte2 == '7' && byte3 == '3' ){
bright7 =77;}
if (byte1 =='0' && byte2 == '7' && byte3 == '4' ){
bright7= 102; }
if (byte1 =='0' && byte2 == '7' && byte3 == '5' ){
bright7= 128; }
if (byte1 =='0' && byte2 == '7' && byte3 == '6' ){
bright7 = 153;}
if (byte1 =='0' && byte2 == '7' && byte3 == '7' ){
bright7 =179;}
if (byte1 =='0' && byte2 == '7' && byte3 == '8' ){
bright7 =204;}
if (byte1 =='0' && byte2 == '7' && byte3 == '9' ){
bright7=230;}
if (byte1 =='0' && byte2 == '7' && byte3 == 'a' ){
bright7=255;}
if (byte1 == '0' && byte2 == '7' && byte3 == 'o')
{start7 = 1;}
if (byte1 == '0' && byte2 == '7' && byte3 == 'f')
{start7 = 0;}

if (byte1 =='0' && byte2 == '6' && byte3 == '0' ){
bright6 =0;}
if (byte1 =='0' && byte2 == '6' && byte3 == '1' ){
bright6 =25;}
if (byte1 =='0' && byte2 == '6' && byte3 == '2' ){
bright6=51;}
if (byte1 =='0' && byte2 == '6' && byte3 == '3' ){
bright6 =77;}
if (byte1 =='0' && byte2 == '6' && byte3 == '4' ){
bright6= 102; }
if (byte1 =='0' && byte2 == '6' && byte3 == '5' ){
bright6= 128; }
if (byte1 =='0' && byte2 == '6' && byte3 == '6' ){
bright6 = 153;}
if (byte1 =='0' && byte2 == '6' && byte3 == '7' ){
bright6 =179;}
if (byte1 =='0' && byte2 == '6' && byte3 == '8' ){
bright6 =204;}
if (byte1 =='0' && byte2 == '6' && byte3 == '9' ){
bright6=230;}
if (byte1 =='0' && byte2 == '6' && byte3 == 'a' ){
bright6=255;}
if (byte1 == '0' && byte2 == '6' && byte3 == 'o')
{start6 = 1;}
if (byte1 == '0' && byte2 == '6' && byte3 == 'f')
{start6 = 0;}

if (byte1 =='0' && byte2 == '5' && byte3 == '0' ){
bright5 =0;}
if (byte1 =='0' && byte2 == '5' && byte3 == '1' ){
bright5 =25;}
if (byte1 =='0' && byte2 == '5' && byte3 == '2' ){
bright5=51;}
if (byte1 =='0' && byte2 == '5' && byte3 == '3' ){
bright5 =77;}
if (byte1 =='0' && byte2 == '5' && byte3 == '4' ){
bright5= 102; }
if (byte1 =='0' && byte2 == '5' && byte3 == '5' ){
bright5= 128; }
if (byte1 =='0' && byte2 == '5' && byte3 == '6' ){
bright5 = 153;}
if (byte1 =='0' && byte2 == '5' && byte3 == '7' ){
bright5 =179;}
if (byte1 =='0' && byte2 == '5' && byte3 == '8' ){
bright5 =204;}
if (byte1 =='0' && byte2 == '5' && byte3 == '9' ){
bright5=230;}
if (byte1 =='0' && byte2 == '5' && byte3 == 'a' ){
bright5=255;}
if (byte1 == '0' && byte2 == '5' && byte3 == 'o')
{start5 = 1;}
if (byte1 == '0' && byte2 == '5' && byte3 == 'f')
{start5 = 0;}

if (byte1 =='0' && byte2 == '4' && byte3 == '0' ){
bright4 =0;}
if (byte1 =='0' && byte2 == '4' && byte3 == '1' ){
bright4 =25;}
if (byte1 =='0' && byte2 == '4' && byte3 == '2' ){
bright4=51;}
if (byte1 =='0' && byte2 == '4' && byte3 == '3' ){
bright4 =77;}
if (byte1 =='0' && byte2 == '4' && byte3 == '4' ){
bright4= 102; }
if (byte1 =='0' && byte2 == '4' && byte3 == '5' ){
bright4= 128; }
if (byte1 =='0' && byte2 == '4' && byte3 == '6' ){
bright4 = 153;}
if (byte1 =='0' && byte2 == '4' && byte3 == '7' ){
bright4 =179;}
if (byte1 =='0' && byte2 == '4' && byte3 == '8' ){
bright4 =204;}
if (byte1 =='0' && byte2 == '4' && byte3 == '9' ){
bright4=230;}
if (byte1 =='0' && byte2 == '4' && byte3 == 'a' ){
bright4=255;}
if (byte1 == '0' && byte2 == '4' && byte3 == 'o')
{start4 = 1;}
if (byte1 == '0' && byte2 == '4' && byte3 == 'f')
{start4 = 0;}

if (byte1 =='0' && byte2 == '3' && byte3 == '0' ){
bright3 =0;}
if (byte1 =='0' && byte2 == '3' && byte3 == '1' ){
bright3 =25;}
if (byte1 =='0' && byte2 == '3' && byte3 == '2' ){
bright3=51;}
if (byte1 =='0' && byte2 == '3' && byte3 == '3' ){
bright3 =77;}
if (byte1 =='0' && byte2 == '3' && byte3 == '4' ){
bright3= 102; }
if (byte1 =='0' && byte2 == '3' && byte3 == '5' ){
bright3= 128; }
if (byte1 =='0' && byte2 == '3' && byte3 == '6' ){
bright3 = 153;}
if (byte1 =='0' && byte2 == '3' && byte3 == '7' ){
bright3 =179;}
if (byte1 =='0' && byte2 == '3' && byte3 == '8' ){
bright3 =204;}
if (byte1 =='0' && byte2 == '3' && byte3 == '9' ){
bright3=230;}
if (byte1 =='0' && byte2 == '3' && byte3 == 'a' ){
bright3=255;}
if (byte1 == '0' && byte2 == '3' && byte3 == 'o')
{start3 = 1;}
if (byte1 == '0' && byte2 == '3' && byte3 == 'f')
{start3 = 0;}
  
 
if (byte1 =='0' && byte2 == '2' && byte3 == '0' ){
bright2 =0;}
if (byte1 =='0' && byte2 == '2' && byte3 == '1' ){
bright2 =25;}
if (byte1 =='0' && byte2 == '2' && byte3 == '2' ){
bright2=51;}
if (byte1 =='0' && byte2 == '2' && byte3 == '3' ){
bright2 =77;}
if (byte1 =='0' && byte2 == '2' && byte3 == '4' ){
bright2= 102; }
if (byte1 =='0' && byte2 == '2' && byte3 == '5' ){
bright2= 128; }
if (byte1 =='0' && byte2 == '2' && byte3 == '6' ){
bright2 = 153;}
if (byte1 =='0' && byte2 == '2' && byte3 == '7' ){
bright2 =179;}
if (byte1 =='0' && byte2 == '2' && byte3 == '8' ){
bright2 =204;}
if (byte1 =='0' && byte2 == '2' && byte3 == '9' ){
bright2=230;}
if (byte1 =='0' && byte2 == '2' && byte3 == 'a' ){
bright2=255;}
if (byte1 == '0' && byte2 == '2' && byte3 == 'o')
{start2 = 1;}
if (byte1 == '0' && byte2 == '2' && byte3 == 'f')
{start2 = 0;}

if (byte1 =='0' && byte2 == '1' && byte3 == '0' ){
bright1 =0;}
if (byte1 =='0' && byte2 == '1' && byte3 == '1' ){
bright1 =25;}
if (byte1 =='0' && byte2 == '1' && byte3 == '2' ){
bright1=51;}
if (byte1 =='0' && byte2 == '1' && byte3 == '3' ){
bright1 =77;}
if (byte1 =='0' && byte2 == '1' && byte3 == '4' ){
bright1= 102; }
if (byte1 =='0' && byte2 == '1' && byte3 == '5' ){
bright1= 128; }
if (byte1 =='0' && byte2 == '1' && byte3 == '6' ){
bright1 = 153;}
if (byte1 =='0' && byte2 == '1' && byte3 == '7' ){
bright1 =179;}
if (byte1 =='0' && byte2 == '1' && byte3 == '8' ){
bright1 =204;}
if (byte1 =='0' && byte2 == '1' && byte3 == '9' ){
bright1=230;}
if (byte1 =='0' && byte2 == '1' && byte3 == 'a' ){
bright1=255;}
if (byte1 == '0' && byte2 == '1' && byte3 == 'o')
{start11 = 1;}
if (byte1 == '0' && byte2 == '1' && byte3 == 'f')
{start1 = 0;}



if (byte1 == '1' && byte2 == '4' && byte3 == 'o'){
 start13 = 0;
 start12 = 0;
 start11 = 0;
 start10 = 0;
 start9 = 0;
 start8 = 0;
 start7 = 0;
 start6 = 0;
 start5 = 0;
 start4 = 0;
 start3 = 0;
start2 = 0;



  for(j=1;j<32;j++)
     {
          for(i=0; i<31; i++)
          {
                if(a[0][i]>a[0][i+1])
                {
                    temp=a[0][i];
                    a[0][i]=a[0][i+1];
                    a[0][i+1]=temp;

                    temp1 = a[1][i];
                    a[1][i] = a[1][i+1];
                    a[1][i+1]=temp1;
                }
          }
     }



for (int v = 0; v<cycles;v++){

analogWrite(13, brightn13);
analogWrite(12, brightn12);
analogWrite(11, brightn11);
analogWrite(10, brightn10);
analogWrite(9, brightn9);
analogWrite(8, brightn8);
analogWrite(7, brightn7);
analogWrite(6, brightn6);
analogWrite(5, brightn5);
analogWrite(4, brightn4);
analogWrite(3, brightn3);
analogWrite(2, brightn2);

if(ton22>0){
digitalWrite(22,1);}
if(ton23>0){
digitalWrite(23,1);}
if(ton24>0){
digitalWrite(24,1);}
if(ton25>0){
digitalWrite(25,1);}
if(ton26>0){
digitalWrite(26,1);}
if(ton27>0){
digitalWrite(27,1);}
if(ton28>0){
digitalWrite(28,1);}
if(ton29>0){
digitalWrite(29,1);}
if(ton30>0){
digitalWrite(30,1);}
if(ton31>0){
digitalWrite(31,1);}
if(ton32>0){
digitalWrite(32,1);}
if(ton33>0){
digitalWrite(33,1);}
if(ton34>0){
digitalWrite(34,1);}
if(ton35>0){
digitalWrite(35,1);}
if(ton36>0){
digitalWrite(36,1);}
if(ton37>0){
digitalWrite(37,1);}
if(ton38>0){
digitalWrite(38,1);}
if(ton39>0){
digitalWrite(39,1);}
if(ton40>0){
digitalWrite(40,1);}
if(ton41>0){
digitalWrite(41,1);}








  
  delay_sec(a[0][0]);
  switch (a[1][0]){
    case 2: digitalWrite(2,0); break;
    case 3: digitalWrite(3,0);break;
    case 4: digitalWrite(4,0);break;
    case 5: digitalWrite(5,0);break;
    case 6: digitalWrite(6,0);break;
    case 7: digitalWrite(7,0);break;
    case 8: digitalWrite(8,0);break;
    case 9: digitalWrite(9,0);break;
    case 10: digitalWrite(10,0);break;
    case 11: digitalWrite(11,0);break;
    case 12: digitalWrite(12,0);break;
    case 13: digitalWrite(13,0);break;
    case 22: digitalWrite(22,0);break;
    case 23: digitalWrite(23,0);break;
    case 24: digitalWrite(24,0);break;
    case 25: digitalWrite(25,0);break;
    case 26: digitalWrite(26,0);break;
    case 27: digitalWrite(27,0);break;
    case 28: digitalWrite(28,0);break;
    case 29: digitalWrite(29,0);break;
    case 30: digitalWrite(30,0);break;
    case 31: digitalWrite(31,0);break;
    case 32: digitalWrite(32,0);break;
    case 33: digitalWrite(33,0);break;
    case 34: digitalWrite(34,0);break;
    case 35: digitalWrite(35,0);break;
    case 36: digitalWrite(36,0);break;
    case 37: digitalWrite(37,0);break;
    case 38: digitalWrite(38,0);break;
    case 39: digitalWrite(39,0);break;
    case 40: digitalWrite(40,0);break;
    case 41: digitalWrite(41,0);break;}
    
    
for (int m =0;m<31;m++)
{
  delay_sec(a[0][m+1]-a[0][m]);
  
  
  switch (a[1][m+1]){
    case 2: digitalWrite(2,0);break;
    case 3: digitalWrite(3,0);break;
    case 4: digitalWrite(4,0);break;
    case 5: digitalWrite(5,0);break;
    case 6: digitalWrite(6,0);break;
    case 7: digitalWrite(7,0);break;
    case 8: digitalWrite(8,0);break;
    case 9: digitalWrite(9,0);break;
    case 10: digitalWrite(10,0);break;
    case 11: digitalWrite(11,0);break;
    case 12: digitalWrite(12,0);break;
    case 13: digitalWrite(13,0);break;
    case 22: digitalWrite(22,0);break;
    case 23: digitalWrite(23,0);break;
    case 24: digitalWrite(24,0);break;
    case 25: digitalWrite(25,0);break;
    case 26: digitalWrite(26,0);break;
    case 27: digitalWrite(27,0);break;
    case 28: digitalWrite(28,0);break;
    case 29: digitalWrite(29,0);break;
    case 30: digitalWrite(30,0);break;
    case 31: digitalWrite(31,0);break;
    case 32: digitalWrite(32,0);break;
    case 33: digitalWrite(33,0);break;
    case 34: digitalWrite(34,0);break;
    case 35: digitalWrite(35,0);break;
    case 36: digitalWrite(36,0);break;
    case 37: digitalWrite(37,0);break;
    case 38: digitalWrite(38,0);break;
    case 39: digitalWrite(39,0);break;
    case 40: digitalWrite(40,0);break;
    case 41: digitalWrite(41,0);break;}
 
}
delay_sec(t_total- a[0][31]);
}
  
  
  
  }

  }
  
  if (start13==1)
  {analogWrite(13,bright13);}
  if (start13==0)
  {analogWrite(13,0);}
  
  if (start12==1)
  {analogWrite(12,bright12);}
  if (start12==0)
  {analogWrite(12,0);}
  
   if (start11==1)
  {analogWrite(11,bright11);}
  if (start11==0)
  {analogWrite(11,0);}
  
  if (start10==1)
  {analogWrite(10,bright10);}
  if (start10==0)
  {analogWrite(10,0);}
  
   if (start9==1)
  {analogWrite(9,bright9);}
  if (start9==0)
  {analogWrite(9,0);}
  
  if (start8==1)
  {analogWrite(8,bright8);}
  if (start8==0)
  {analogWrite(8,0);}
  
  if (start7==1)
  {analogWrite(7,bright7);}
  if (start7==0)
  {analogWrite(7,0);}
  
  if (start6==1)
  {analogWrite(6,bright6);}
  if (start6==0)
  {analogWrite(6,0);}
  
  if (start5==1)
  {analogWrite(5,bright5);}
  if (start5==0)
  {analogWrite(5,0);}
  
  if (start4==1)
  {analogWrite(4,bright4);}
  if (start4==0)
  {analogWrite(4,0);}
  
  if (start3==1)
  {analogWrite(3,bright3);}
  if (start3==0)
  {analogWrite(3,0);}
  
  if (start2==1)
  {analogWrite(2,bright2);}
  if (start2==0)
  {analogWrite(2,0);}
  
delay(50);
}

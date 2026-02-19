#include <RH_ASK.h> // Include RadioHead Amplitude Shift Keying Library
#include <SPI.h> // Include dependant SPI Library
const int trigPin = 8;
const int echoPin = 9;
const int vibration = 12;
const int buzzer = 13;
// Create Amplitude Shift Keying Object
RH_ASK rf_driver;
void setup(){
  // Initialize ASK Object
  rf_driver.init();
  pinMode(buzzer,OUTPUT);
  pinMode(vibration,OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  // Setup Serial Monitor
  Serial.begin(9600);
}
void loop(){
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Measure the time it takes for the pulse to bounce back
  long duration = pulseIn(echoPin, HIGH);
  // Calculate the distance in centimeters
  float lower_distance = duration * 0.034 / 2;
  // Print the distance to the serial monitor
  Serial.print("Distance: ");
  Serial.print(lower_distance);
  Serial.println(" cm");
  // Set buffer to size of expected message
  int upper_distance;
  uint8_t buflen = 1;
  uint8_t buf[buflen];
  // Check if received packet is correct size
  if(rf_driver.recv(buf, &buflen)){
  // Message received with valid checksum
    upper_distance=*buf;
    Serial.print("Message Received: ");
    Serial.println(upper_distance);
  }
  if((lower_distance>=3 && lower_distance<=100) && (upper_distance>=3 && upper_distance<=80)){
    digitalWrite(vibration,HIGH);
    //digitalWrite(buzzer,HIGH);
    tone(buzzer,450);
    delay(500);
    noTone(buzzer);
    delay(500);
    Serial.println("Yes");
  }
  else if(lower_distance>=3 && lower_distance<=100){
    digitalWrite(vibration,HIGH);
    //digitalWrite(buzzer,HIGH);
    tone(buzzer,abs(85-lower_distance),500);
    delay(500);
    Serial.println("Yes");
  }
  else if(upper_distance>=3 && upper_distance<=80){
    digitalWrite(vibration,HIGH);
    //digitalWrite(buzzer,HIGH);
    tone(buzzer,abs(85-upper_distance),500);
    delay(500);
    Serial.println("Yes");
  }
  else{
    digitalWrite(buzzer,LOW);
    digitalWrite(vibration,LOW);
    Serial.println("No");
  }
  //delay(2000);
}

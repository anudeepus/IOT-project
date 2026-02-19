#include <RH_ASK.h> // Include RadioHead Amplitude Shift Keying Library
#include <SPI.h> // Include dependant SPI Library
const int trigPin = 9;
const int echoPin = 10;
// Create Amplitude Shift Keying Object
RH_ASK rf_driver;
void setup(){
  // Initialize ASK Object
  rf_driver.init();
  // Setup Serial Monitor
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
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
  float distance = duration * 0.034 / 2;
  // Print the distance to the serial monitor
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  uint8_t data = distance;
  rf_driver.send(&data, 1);
  rf_driver.waitPacketSent();
  {
    // Message Transmitted
    Serial.println("Message Transmitted: ");
    //delay(2000);
  }
}

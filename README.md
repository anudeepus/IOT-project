👟 Smart Shoes for the Visually Impaired (IoT Project)
📌 Overview

The Smart Shoes project is an assistive wearable IoT system designed to help visually impaired individuals navigate their surroundings safely and independently. The system detects nearby obstacles using ultrasonic sensors and provides real-time feedback through vibration motors and audio alerts.

This project uses wireless RF communication to transmit distance information from shoe-mounted sensors to a receiver unit, ensuring timely and reliable obstacle detection.

🎯 Objectives

Assist visually impaired users in detecting obstacles

Provide real-time haptic and audio feedback

Enable wireless communication between sensing and feedback units

Improve user safety and independent mobility

🧠 System Architecture

The system is divided into two main modules:

Transmitter Module (Shoe Unit)

Receiver Module (Waist/Belt Unit)

The transmitter measures obstacle distance and sends the data wirelessly to the receiver, which processes the information and alerts the user accordingly.

📁 Project Structure
IOT-project
├── Transmitter
│   └── transmitter.ino
├── Receiver
│   └── receiver.ino
└── README.md

📡 Transmitter Module

File: Transmitter/transmitter.ino

Description

The transmitter module is responsible for sensing obstacles. It uses an ultrasonic sensor to measure the distance between the user and nearby objects. The measured distance is transmitted wirelessly using a 433 MHz RF transmitter module with the RadioHead ASK protocol.

Functions

Measures distance using an ultrasonic sensor

Converts echo time into distance values

Transmits distance data wirelessly via RF (ASK)

Operates in real-time for continuous sensing

📥 Receiver Module

File: Receiver/receiver.ino

Description

The receiver module acts as the decision-making unit of the system. It receives distance data from the transmitter via RF communication and also measures local obstacle distance using an ultrasonic sensor. Based on predefined distance thresholds, it activates a vibration motor and buzzer to alert the user.

Functions

Receives distance data wirelessly via RF module

Measures local obstacle distance

Compares distance values with safety thresholds

Activates vibration motor and buzzer for feedback

Provides adaptive alerts based on obstacle proximity

🔧 Hardware Components

Arduino Uno / Nano

Ultrasonic Sensor (HC-SR04)

RF Transmitter & Receiver (433 MHz)

Vibration Motor

Buzzer

Battery / Power Module

Connecting Wires

💻 Software & Libraries

Arduino IDE

Embedded C/C++

RadioHead ASK Library

SPI Library

🔄 Communication Protocol

Wireless Communication: RF (433 MHz)

Protocol: RadioHead ASK (Amplitude Shift Keying)

Data Type: Distance value (in centimeters)

🧪 Testing & Results

The system was tested in both indoor and outdoor environments with various obstacles such as walls, furniture, and pedestrians. The Smart Shoes system successfully detected obstacles within the defined range and provided timely vibration and audio alerts, demonstrating reliable performance and usability.

🚀 Applications

Assistive technology for visually impaired individuals

Wearable IoT systems

Smart healthcare devices

Obstacle detection and navigation systems

🔮 Future Enhancements

Improve distance measurement accuracy

Integrate additional sensors (IR, camera, GPS)

Add Bluetooth or mobile app integration

Implement machine learning for smarter navigation

Reduce power consumption for extended usage

👨‍💻 Author

Anudeep Reddy Gali
IoT & Embedded Systems Project

📜 License

This project is for educational and research purposes.

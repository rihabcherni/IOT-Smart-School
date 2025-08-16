# Smart School System

## Description
The **Smart School System** is an innovative IoT solution designed to modernize school infrastructures. It optimizes classroom management, student monitoring, and facilitates communication through a dedicated mobile application. Additionally, it improves parking management by enabling real-time monitoring of available spaces. The system integrates sensors, a Wi-Fi module, and Firebase to deliver a smooth and intuitive user experience.

## Features
### Smart Class
- Real-time monitoring of classroom conditions (temperature, humidity, etc.).
- Automatic control of lighting, air conditioning, and heating.
- RFID system for student attendance tracking.
- Visual and sound notifications to signal alerts or states.
- Communication between IoT hardware and the app via the Wi-Fi module.

### Smart Parking System
- Real-time detection of available parking spots.
- Data transmission to Firebase for storage and processing.
- Access to a mobile app displaying the current parking status.

## Architecture
The system architecture includes the following components:
1. **IoT Sensors**: Monitoring environmental parameters.
2. **Wi-Fi Module**: Data transmission to Firebase.
3. **Firebase**: Real-time cloud storage.
4. **Mobile Application**: User interface for system monitoring and management.

## Hardware Used
### Main Components
- **Arduino UNO**: Main microcontroller for data processing.
- **Wi-Fi Module (ESP8266/ESP32)**: Network connectivity.
- **Sensors (DHT11, RFID, etc.)**: Data collection.
- **LCD Display**: Real-time information display.
- **LEDs and Buzzer**: Visual and sound signals.

### Software Technologies
- Arduino IDE for microcontroller programming.
- Firebase for cloud data management.
- Flutter for mobile application development.

## Overview
### Smart School System Architecture
![Smart School System Architecture](img/Architecture.PNG)

This diagram presents the overall architecture of the Smart School System, illustrating the integration of IoT sensors, Wi-Fi modules, and Firebase for intelligent management of school resources and parking.

### Real Circuit Diagram for the Smart School System
![Real Circuit Diagram](img/reel.PNG)

This is the actual electronic circuit developed for the Smart School System, representing the hardware configuration and components used to ensure proper system operation.

### Smart Class Circuit Diagram
![Smart Class Circuit Diagram](Schéma_électronique_Smart_Class.PNG)

This diagram shows the electronic components involved in smart classroom management, including sensors and devices for monitoring room occupancy and student attendance.

### Smart Parking Circuit Diagram
![Smart Parking Circuit Diagram](Schéma_électronique_Smart_Parking.PNG)

Illustration of the electronic circuit used for smart parking management, with sensors to monitor parking space availability in real time.

### Loading and Authentication Interfaces
![Loading and Authentication Interfaces](img/i1.PNG)

This image shows the loading and authentication interfaces of the mobile application, allowing users to securely log into the system.

### Home and Parking Management Interfaces
![Home and Parking Management Interfaces](img/i2.PNG)

The home and parking management interface displays real-time parking availability information, providing a clear and accessible overview of the parking lot status.

### Smart Class Management Interfaces
![Smart Class Management Interfaces](img/i3.PNG)

This interface allows managing the smart classroom by displaying information related to room occupancy, student tracking, resource management (temperature, humidity, etc.), and alerts.

## Authors
**Cherni Rihab & Benhamed Ranime & Sidi Mohamed Ahmed**  
(Computer Engineering Students at ENSIT (NTS))

# Smart School System

## Description
Le projet **Smart School System** est une solution IoT innovante visant à moderniser les infrastructures scolaires. Il optimise la gestion des salles de classe, le suivi des élèves, et facilite la communication via une application mobile dédiée. De plus, il améliore la gestion des parkings en permettant la surveillance en temps réel de la disponibilité des places. Le système intègre des capteurs, un module Wi-Fi et Firebase pour offrir une expérience utilisateur fluide et intuitive.

## Fonctionnalités
### Smart Class
- Surveillance en temps réel des conditions de la classe (température, humidité, etc.).
- Contrôle automatique de l’éclairage, de la climatisation et du chauffage.
- Système RFID pour enregistrer la présence des élèves.
- Notifications visuelles et sonores pour signaler des alertes ou des états.
- Communication entre le matériel IoT et l’application via le module Wi-Fi.

### Smart Parking System
- Détection en temps réel du nombre de places de stationnement disponibles.
- Transmission des données collectées vers Firebase pour stockage et traitement.
- Accès à une application mobile permettant de visualiser l'état du parking.

## Architecture
L’architecture du système inclut les éléments suivants :
1. **Capteurs IoT** : Surveillance des paramètres environnementaux.
2. **Module Wi-Fi** : Transmission des données vers Firebase.
3. **Firebase** : Stockage cloud en temps réel.
4. **Application Mobile** : Interface utilisateur pour surveiller et gérer le système.

## Matériel Utilisé
### Composants Principaux
- **Arduino UNO** : Microcontrôleur principal pour le traitement des données.
- **Module Wi-Fi (ESP8266/ESP32)** : Connectivité réseau.
- **Capteurs (DHT11, RFID, etc.)** : Collecte de données.
- **Afficheur LCD** : Affichage des informations en temps réel.
- **LEDs et Buzzer** : Signalisations visuelles et sonores.

### Technologies Logicielles
- Arduino IDE pour la programmation des microcontrôleurs.
- Firebase pour la gestion des données cloud.
- Flutter pour le développement de l’application mobile.

## Installation
1. Clonez le dépôt 
2. Configurez Firebase 
3. Téléversez le code sur la carte Arduino via l’IDE Arduino.
4. Configurez l’application mobile pour se connecter à Firebase.

## Utilisation
1. Allumez le système et connectez-le au réseau Wi-Fi.
2. Visualisez les données des classes en temps réel via l’application mobile.
3. Contrôlez les systèmes de chaque salle (éclairage, climatisation, etc.) directement depuis l’application.


## Aperçu
![Smart School System Architecture](img/Architecture.PNG)
![Schéma électronique Smart Class](Schéma électronique Smart Class.PNG)
![Schéma électronique Smart Parking](Schéma électronique Smart Parking.PNG)

![Interfaces de chargement et d'authentification](img/i1.PNG)
![Interfaces d'accueil et de gestion de parking](img/i2.PNG)
![Interfaces gestion de classe intelligente](img/i3.PNG)

## Auteurs
**Cherni Rihab -Benhamed Ranime - Sidi Mohamed Ahmed** - Étudiants en génie informatique à l'ENSIT (NTS).

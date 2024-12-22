# Smart School System

## Description
Le projet **Smart School System** est une solution IoT innovante visant à moderniser les infrastructures scolaires. Grâce à une architecture intelligente basée sur des capteurs, des modules Wi-Fi et Firebase, il améliore la gestion des salles de classe, le suivi des élèves et la communication avec une application mobile dédiée.

## Fonctionnalités
### Smart Class
- Surveillance en temps réel des conditions de la classe (température, humidité, etc.).
- Contrôle automatique de l’éclairage, de la climatisation et du chauffage.
- Système RFID pour enregistrer la présence des élèves.
- Notifications visuelles et sonores pour signaler des alertes ou des états.
- Communication entre le matériel IoT et l’application via le module Wi-Fi.

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
![Smart School System Architecture](images/system_architecture.png)

## Auteurs
**Cherni Rihab -Benhamed Ranime - Sidi Mohamed Ahmed** - Étudiants en génie informatique à l'ENSIT (NTS).

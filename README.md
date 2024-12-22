# Smart Parking System

## Description
Le projet **Smart Parking System** est une solution IoT conçue pour optimiser la gestion des parkings. Grâce à une combinaison de capteurs, d'un module Wi-Fi et de Firebase, le système permet de surveiller la disponibilité des places de stationnement en temps réel et offre une interface utilisateur conviviale via une application mobile.

## Fonctionnalités
- Détection en temps réel des places de stationnement disponibles.
- Transmission des données collectées vers Firebase pour stockage et traitement.
- Accès à une application mobile permettant de :
  - Visualiser l'état du parking.
  - Gérer les réservations à distance.
- Notifications en cas de changement d'état des places.

## Architecture
Le système repose sur une architecture intégrant les éléments suivants :
1. **Capteurs** : Détection de la disponibilité des places de stationnement.
2. **Module Wi-Fi** : Communication avec Firebase.
3. **Firebase** : Stockage des données et synchronisation en temps réel.
4. **Application Mobile** : Interface utilisateur pour la gestion du parking.

## Matériel Utilisé
- Arduino UNO
- Capteurs de distance (ou autres capteurs adaptés)
- Module Wi-Fi (ex. ESP8266 ou ESP32)
- LEDs pour simulation visuelle
- Buzzer pour alertes audibles

## Dépendances Logicielles
- [Arduino IDE](https://www.arduino.cc/en/software) pour la programmation de la carte.
- [Firebase](https://firebase.google.com/) pour la gestion des données cloud.
- Application mobile (développée avec Flutter ou autre framework compatible).

## Installation
1. Clonez le dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/smart-parking-system.git
   cd smart-parking-system
   ```
2. Configurez Firebase :
   - Créez un projet sur Firebase et récupérez les clés d'authentification.
   - Configurez l'URL de Firebase dans le code Arduino et l'application mobile.
3. Téléversez le code sur la carte Arduino via l'IDE Arduino.
4. Configurez l'application mobile en connectant Firebase.

## Utilisation
1. Allumez le système et connectez-le au Wi-Fi.
2. Sur l'application mobile, connectez-vous à Firebase pour visualiser les données en temps réel.
3. Consultez la disponibilité des places et effectuez vos réservations.

## Structure du Projet
```
smart-parking-system/
├── arduino_code/          # Code pour la carte Arduino
├── mobile_app/            # Code source de l'application mobile
├── images/                # Images des composants et captures d'écran
├── README.md              # Documentation du projet
└── LICENSE                # Licence open-source
```

## Aperçu
![Smart Parking Architecture](images/architecture_diagram.png)

## Contribution
Les contributions sont les bienvenues !  
1. Forkez ce dépôt.
2. Créez une branche pour vos modifications :
   ```bash
   git checkout -b feature/ma-fonctionnalite
   ```
3. Faites un commit de vos modifications :
   ```bash
   git commit -m "Ajout de ma fonctionnalité"
   ```
4. Poussez la branche et ouvrez une pull request.

## Licence
Ce projet est sous licence [MIT](LICENSE).

## Auteur
**Votre Nom** - Étudiant en génie informatique à l'ENSIT.

Pour toute question ou suggestion, veuillez ouvrir une [issue](https://github.com/votre-utilisateur/smart-parking-system/issues).




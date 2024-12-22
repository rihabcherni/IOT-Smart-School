#include <SPI.h>
#include <MFRC522.h>
#include <LiquidCrystal_I2C.h>
#include <DHT.h>
#include <WiFi101.h>  
#include <FirebaseArduino.h>  

// Définir les pins
#define SS_PIN 5
#define RST_PIN 4
#define RED_LED 12
#define GREEN_LED 13
#define BUZZER 10
#define DHT_PIN 9
#define DHT_TYPE DHT11
#define chauffo_pin  3
#define ventillo_pin 11
#define lampe_pin 7
void handleRFID();
void handleStudentAccess(Student &student);
void indicatePermissionGranted();
void indicatePermissionDenied();
void sendToFirebase(float temperature, float humidity);
void controlDevices();

void setup() {

  Serial.begin(115200);

  // Connexion au WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("WiFi connected");

  // Connexion à Firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

  // Configuration des composants
  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(chauffo_pin, OUTPUT);
  pinMode(ventillo_pin, OUTPUT);
  pinMode(lampe_pin, OUTPUT);

  lcd.init();
  lcd.backlight();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Smart class");
  Serial.println("System Initialized");

  SPI.begin();
  mfrc522.PCD_Init();
  dht.begin();
  digitalWrite(RED_LED, HIGH);
  digitalWrite(GREEN_LED, LOW);
}

void loop() {
  // Affichage
  lcd.clear();
  if (T.IN) {
    lcd.setCursor(0, 0);
    lcd.print("S: ");
    lcd.print(students);
  } else {
    lcd.setCursor(0, 0);
    lcd.print("T, scan");
  }

  // Lecture du DHT11 et affichage
  float temperature = dht.readTemperature();
  float humidity = dht.readHumidity();

  if (isnan(temperature) || isnan(humidity)) {
    Serial.println("Error reading DHT");
  } else {
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.print(" *C, Humi: ");
    Serial.print(humidity);
    Serial.println(" %");

    lcd.setCursor(0, 1);
    lcd.print("T:");
    lcd.print(temperature);
    lcd.print("C H:");
    lcd.print(humidity);
    lcd.print("%");

    // Envoi des données à Firebase
    sendToFirebase(temperature, humidity);
  }

  delay(2000); 
  controlDevices();  // Contrôler les appareils en fonction des données Firebase

  // Gestion du RFID
  handleRFID();
}

void controlDevices() {
 
  bool ventillo_state = Firebase.getBool("ventillo");
  bool lampe_state = Firebase.getBool("lampe");
  bool chauffo_state = Firebase.getBool("chauffo");

  // Contrôler les appareils
  digitalWrite(ventillo_pin, ventillo_state ? HIGH : LOW);
  digitalWrite(lampe_pin, lampe_state ? HIGH : LOW);
  digitalWrite(chauffo_pin, chauffo_state ? HIGH : LOW);

  // Afficher l'état sur le moniteur série
  Serial.print("Ventillo: ");
  Serial.println(ventillo_state ? "ON" : "OFF");
  Serial.print("Lampe: ");
  Serial.println(lampe_state ? "ON" : "OFF");
  Serial.print("Climatiseur: ");
  Serial.println(chauffo_state ? "ON" : "OFF");
}

void handleRFID() {
  if (!mfrc522.PICC_IsNewCardPresent() || !mfrc522.PICC_ReadCardSerial()) {
    return;
  }

  // Lire la carte RFID
  String content = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase();

  // Vérifier l'ID
  // Envoyer les données de température et d'humidité à Firebase
  Firebase.setFloat("temperature", temperature);
  Firebase.setFloat("humidity", humidity);
}
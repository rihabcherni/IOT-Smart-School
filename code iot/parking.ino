#include <Wire.h>
#include <Servo.h>
#include <LiquidCrystal_I2C.h>
#include <Arduino_FreeRTOS.h>
#include <task.h>
#include <WiFiEsp.h>
#include <WiFiEspClient.h>
#include <FirebaseESP8266.h>
#include <SoftwareSerial.h>

#define WIFI_SSID "ritejbenhamed"
#define WIFI_PASSWORD "hellohello"
#define FIREBASE_HOST "https://smartp-74e4c-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "AIzaSyAmp_HUqiWs_iSZm9mFDTOQ4lY-mrYWdcg"

const int pirentry = 2;
const int pirexit = 3;
const int servoPin = 9;
const int ledpin = 13;

volatile bool pirEntree = false;
volatile bool pirSortie = false;
volatile int placesDispo = 2;
volatile int servoCommand = 0;

Servo myServo;
LiquidCrystal_I2C lcd(0x27, 16, 2);
FirebaseData fbdo;

SoftwareSerial espSerial(6, 7); // RX, TX for ESP module
WiFiEspClient client;

void setup() {
  pinMode(pirentry, INPUT);
  pinMode(pirexit, INPUT);
  pinMode(ledpin, OUTPUT);

  myServo.attach(servoPin);
  myServo.write(0);
  lcd.init();
  lcd.backlight();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("MY SMART PARKING");
  Serial.begin(9600);

  espSerial.begin(9600); // Communication with ESP8266
  WiFi.init(&espSerial);

  if (WiFi.status() != WL_CONNECTED) {
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED) {
      delay(500);
      Serial.print(".");
    }
  }
  Serial.println("\nWiFi Connected");

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);

  xTaskCreate(EntryExit, "EntryExit", 128, NULL, 1, NULL);
  xTaskCreate(DisplayLCD, "DisplayLCD", 128, NULL, 1, NULL);
}

void loop() {}

void EntryExit(void *pvParameters) {
  for (;;) {
    pirEntree = digitalRead(pirentry);
    pirSortie = digitalRead(pirexit);

    if (pirEntree && placesDispo > 0) {
      placesDispo--;
      myServo.write(90);
      delay(3000);
      myServo.write(0);
    } else if (pirSortie && placesDispo < 2) {
      placesDispo++;
      myServo.write(90);
      delay(3000);
      myServo.write(0);
    } else {
      myServo.write(servoCommand == 1 ? 90 : 0);
    }

    Serial.print("PIR Entrée: ");
    Serial.print(pirEntree ? "Détecté" : "Non détecté");
    Serial.print(" | PIR Sortie: ");
    Serial.print(pirSortie ? "Détecté" : "Non détecté");
    Serial.print(" | Places disponibles: ");
    Serial.println(placesDispo);

    Firebase.setInt(fbdo, "/parking/placesDispo", placesDispo);

    vTaskDelay(5000 / portTICK_PERIOD_MS);
  }
}

void DisplayLCD(void *pvParameters) {
  for (;;) {
    lcd.clear();

    if (placesDispo == 0) {
      lcd.setCursor(0, 0);
      lcd.print("Parking Plein!");
      lcd.setCursor(0, 1);
      lcd.print("Revenez plus tard");
    } else {
      lcd.setCursor(0, 0);
      lcd.print("Parking Disponible");
      lcd.setCursor(0, 1);
      lcd.print("Places: ");
      lcd.print(placesDispo);
    }

    Serial.print("LCD: ");
    Serial.print(placesDispo == 0 ? "Parking Plein! " : "Parking Disponible, ");
    Serial.print("Places dispo: ");
    Serial.println(placesDispo);

    Firebase.setInt(fbdo, "/parking/placesDispo", placesDispo);

    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
}

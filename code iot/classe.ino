#include <SPI.h>
#include <MFRC522.h>
#include <LiquidCrystal_I2C.h>
#include <DHT.h>
#include <WiFi101.h> 
#include <FirebaseArduino.h>  

#define SS_PIN 5
#define RST_PIN 4
#define RED_LED 12
#define GREEN_LED 13
#define BUZZER 10
#define DHT_PIN 9
#define DHT_TYPE DHT11
#define chauffo_pin  3
#define ventillo_pin 11

const char* ssid = "ritejbenhamed";
const char* password = "hellohello";
#define FIREBASE_HOST "https://smartclass-72e4b-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "QUiorg_HUIop_iSZm9mFDTOQ2lY-iorhbslk"

LiquidCrystal_I2C lcd(0x27, 16, 2);

MFRC522 mfrc522(SS_PIN, RST_PIN);

DHT dht(DHT_PIN, DHT_TYPE);

struct Student {
  String ID;
  unsigned long entry_Time;
  unsigned long leave_Time;
  unsigned long total_Time;
  bool IN;
  bool accepted;
};
struct Teacher {
  String ID;
  unsigned long session_Start;
  unsigned long session_End;
  double session_Time;
  bool IN;
};

Student s1 = {"0x43, 0x97, 0x15", 0, 0, 0, false, false};
Student s2 = {"43 97 15 12", 0, 0, 0, false, false};
Student s3 = {"11 28 DF DB", 0, 0, 0, false, false};
Teacher T = {"77 11 A9 5F", 0, 0, 0, false};

unsigned int students = 0;

// Function prototypes
void handleRFID();
void handleStudentAccess(Student &student);
void indicatePermissionGranted();
void indicatePermissionDenied();
void sendToFirebase(float temperature, float humidity);

void setup() {

  Serial.begin(115200);

  // Connect to WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("WiFi connected");

  // Connect to Firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(chauffo_pin, OUTPUT);
  pinMode(ventillo_pin, OUTPUT);

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

  lcd.clear();
  if (T.IN) {
    lcd.setCursor(0, 0);
    lcd.print("S: ");
    lcd.print(students);
  } else {
    lcd.setCursor(0, 0);
    lcd.print("T, scan");
  }

  // DHT11 reading and display
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

    // Send temperature and humidity data to Firebase
    sendToFirebase(temperature, humidity);
  }

  delay(2000); // Adjust delay to fit system needs
  AutoRegulation(temperature, humidity);

  // Handle RFID
  handleRFID();
}

void AutoRegulation(float temperature, float humidity) {
  // Régulation du refroidissement et du chauffage en fonction de la température
  if (temperature > 27 || humidity > 80) {
    digitalWrite(ventillo_pin, HIGH);
    digitalWrite(chauffo_pin, LOW);
    if (temperature > 27) {
      Serial.println(" ->> Température élevée ! Ventilateur activé, chauffage désactivé !");
    }
    if (humidity > 80) {
      Serial.println(" ->> Humidité de l'air trop élevée ! Activation du ventilateur pour réduire l'humidité.");
    }
  } else if (temperature < 21) {
    digitalWrite(chauffo_pin, HIGH);
    digitalWrite(ventillo_pin, LOW);
    Serial.println(" ->> Température basse ! Chauffage activé, ventilateur désactivé !");
  } else {
    digitalWrite(chauffo_pin, LOW);
    digitalWrite(ventillo_pin, LOW);
    Serial.println(" ->> Température favorable ! Chauffage et ventilateur désactivés !");
  }
}

void handleRFID() {
  if (!mfrc522.PICC_IsNewCardPresent() || !mfrc522.PICC_ReadCardSerial()) {
    return;
  }

  // Read card
  String content = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase();

  // Verify ID
  if (content.substring(1) == T.ID) {
    if (!T.IN) {
      T.IN = true;
      T.session_Start = millis() / 1000;
    } else {
      T.IN = false;
      T.session_End = millis() / 1000;
      T.session_Time = T.session_End - T.session_Start;
    }
    indicatePermissionGranted();
  } else if (content.substring(1) == s1.ID) {
    handleStudentAccess(s1);
  } else if (content.substring(1) == s2.ID) {
    handleStudentAccess(s2);
  } else if (content.substring(1) == s3.ID) {
    handleStudentAccess(s3);
  } else {
    indicatePermissionDenied();
  }

  mfrc522.PICC_HaltA();
}

void handleStudentAccess(Student &student) {
  if (!student.IN) {
    student.IN = true;
    students++;
    if (T.IN) {
      student.entry_Time = millis() / 1000;
    }
    indicatePermissionGranted();
  } else {
    student.IN = false;
    students--;
    if (T.IN) {
      student.leave_Time = millis() / 1000;
      student.total_Time += student.leave_Time - student.entry_Time;
    }
  }
}

void indicatePermissionGranted() {
  digitalWrite(GREEN_LED, HIGH);
  digitalWrite(RED_LED, LOW);
  digitalWrite(BUZZER, HIGH);
  delay(500);
  digitalWrite(BUZZER, LOW);
}

void indicatePermissionDenied() {
  digitalWrite(RED_LED, HIGH);
  digitalWrite(GREEN_LED, LOW);
  digitalWrite(BUZZER, HIGH);
  delay(500);
  digitalWrite(BUZZER, LOW);
}

void sendToFirebase(float temperature, float humidity) {
  // Send temperature and humidity data to Firebase
  Firebase.setFloat("temperature", temperature);
  Firebase.setFloat("humidity", humidity);
}
/*
 * SIREGA - Firmware ESP32-S3 (Xiao) — Modo Híbrido BLE + WiFi
 * 
 * Hardware:
 *   - Seeed Studio XIAO ESP32S3
 *   - Lector NFC PN532 (I2C o SPI)
 *   - Antena externa BLE (conector U.FL del Xiao)
 *   - Batería LiPo 600mAh
 *
 * Modos de operación:
 *   BLE (default): Bajo consumo. Anuncia como "SIREGA-NFC" y envía UIDs
 *                  por notificación BLE (Nordic UART Service).
 *   WiFi:          WebSocket AP en 192.168.4.1/ws (modo original).
 *
 * El modo se puede cambiar con un botón o comando BLE.
 * En modo BLE, el WiFi está apagado para ahorrar batería.
 *
 * Bibliotecas necesarias (Arduino IDE / PlatformIO):
 *   - Adafruit_PN532 (NFC)
 *   - ESP32 BLE Arduino (incluido en el core ESP32)
 *   - WebSocketsServer (solo para modo WiFi)
 *   - WiFi (solo para modo WiFi)
 *
 * Board: Seeed XIAO ESP32S3
 * Partition: Default 4MB with spiffs
 */

#include <Wire.h>
#include <Adafruit_PN532.h>

// ── NFC (I2C) ──────────────────────────────────────────────────────────
// Pines I2C del XIAO ESP32S3
#define SDA_PIN 5
#define SCL_PIN 6
Adafruit_PN532 nfc(SDA_PIN, SCL_PIN);

// ── Modo de operación ──────────────────────────────────────────────────
enum ConnectionMode { MODE_BLE, MODE_WIFI };
ConnectionMode currentMode = MODE_BLE;

// ── BLE ────────────────────────────────────────────────────────────────
#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

// Nordic UART Service UUIDs (deben coincidir con esp32_ble_service.dart)
#define SERVICE_UUID        "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
#define CHARACTERISTIC_UUID "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

BLEServer*         bleServer = nullptr;
BLECharacteristic* bleCharacteristic = nullptr;
bool               bleClientConnected = false;
bool               bleAdvertising = false;

class ServerCallbacks : public BLEServerCallbacks {
  void onConnect(BLEServer* pServer) override {
    bleClientConnected = true;
    Serial.println("[BLE] Cliente conectado");
  }
  void onDisconnect(BLEServer* pServer) override {
    bleClientConnected = false;
    Serial.println("[BLE] Cliente desconectado");
    // Reiniciar advertising para permitir reconexión
    delay(100);
    pServer->startAdvertising();
  }
};

// ── WiFi + WebSocket ───────────────────────────────────────────────────
#include <WiFi.h>
#include <WebSocketsServer.h>

const char* AP_SSID = "ESP32-NFC";
const char* AP_PASS = ""; // Abierta para facilidad
WebSocketsServer webSocket(80);
bool wifiStarted = false;

void webSocketEvent(uint8_t num, WStype_t type, uint8_t* payload, size_t length) {
  switch (type) {
    case WStype_CONNECTED:
      Serial.printf("[WiFi] Cliente #%u conectado\n", num);
      break;
    case WStype_DISCONNECTED:
      Serial.printf("[WiFi] Cliente #%u desconectado\n", num);
      break;
    default:
      break;
  }
}

// ── Funciones de modo ──────────────────────────────────────────────────

void startBLE() {
  if (wifiStarted) {
    Serial.println("[MODO] Apagando WiFi...");
    webSocket.close();
    WiFi.softAPdisconnect(true);
    WiFi.mode(WIFI_OFF);
    wifiStarted = false;
    delay(100);
  }

  if (!bleServer) {
    Serial.println("[BLE] Inicializando BLE...");
    BLEDevice::init("SIREGA-NFC");
    
    // Configurar potencia de transmisión (con antena externa se puede bajar)
    BLEDevice::setPower(ESP_PWR_LVL_P3); // +3 dBm — buen rango con antena
    
    bleServer = BLEDevice::createServer();
    bleServer->setCallbacks(new ServerCallbacks());

    BLEService* service = bleServer->createService(SERVICE_UUID);
    
    bleCharacteristic = service->createCharacteristic(
      CHARACTERISTIC_UUID,
      BLECharacteristic::PROPERTY_NOTIFY | BLECharacteristic::PROPERTY_READ
    );
    bleCharacteristic->addDescriptor(new BLE2902());
    
    service->start();
  }

  if (!bleAdvertising) {
    BLEAdvertising* advertising = BLEDevice::getAdvertising();
    advertising->addServiceUUID(SERVICE_UUID);
    advertising->setScanResponse(true);
    // Intervalos de advertising optimizados para batería
    advertising->setMinPreferred(0x12); // ~11.25ms * 0x12 = ~202ms
    advertising->setMaxPreferred(0x24); // ~11.25ms * 0x24 = ~405ms
    BLEDevice::startAdvertising();
    bleAdvertising = true;
  }

  Serial.println("[MODO] BLE activo — WiFi apagado");
}

void startWiFi() {
  if (bleServer) {
    Serial.println("[MODO] Apagando BLE...");
    BLEDevice::getAdvertising()->stop();
    bleAdvertising = false;
    // No podemos hacer deinit de BLE sin reiniciar, pero dejamos de hacer advertising
  }

  if (!wifiStarted) {
    Serial.println("[WiFi] Iniciando Access Point...");
    WiFi.mode(WIFI_AP);
    WiFi.softAP(AP_SSID, AP_PASS);
    
    webSocket.begin();
    webSocket.onEvent(webSocketEvent);
    wifiStarted = true;
    
    Serial.print("[WiFi] AP IP: ");
    Serial.println(WiFi.softAPIP());
  }

  Serial.println("[MODO] WiFi activo");
}

// ── NFC ────────────────────────────────────────────────────────────────

String readNfcUid() {
  uint8_t uid[7];
  uint8_t uidLength;

  if (nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength, 100)) {
    String uidStr = "";
    for (uint8_t i = 0; i < uidLength; i++) {
      if (uid[i] < 0x10) uidStr += "0";
      uidStr += String(uid[i], HEX);
    }
    uidStr.toUpperCase();
    return uidStr;
  }
  return "";
}

void sendUid(const String& uid) {
  if (currentMode == MODE_BLE) {
    if (bleClientConnected && bleCharacteristic) {
      bleCharacteristic->setValue(uid.c_str());
      bleCharacteristic->notify();
      Serial.printf("[BLE] Enviado UID: %s\n", uid.c_str());
    }
  } else {
    // Modo WiFi — enviar a todos los clientes WebSocket
    webSocket.broadcastTXT(uid);
    Serial.printf("[WiFi] Enviado UID: %s\n", uid.c_str());
  }
}

// ── Setup & Loop ───────────────────────────────────────────────────────

void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("\n=== SIREGA NFC Reader — ESP32-S3 ===");

  // Inicializar NFC
  Wire.begin(SDA_PIN, SCL_PIN);
  nfc.begin();
  
  uint32_t versiondata = nfc.getFirmwareVersion();
  if (!versiondata) {
    Serial.println("[NFC] ERROR: No se encontró el PN532");
    while (1) { delay(1000); }
  }
  
  Serial.printf("[NFC] PN532 encontrado — Firmware v%d.%d\n",
    (versiondata >> 16) & 0xFF, (versiondata >> 8) & 0xFF);
  
  nfc.SAMConfig();
  nfc.setPassiveActivationRetries(0x01); // Un solo intento para no bloquear

  // Iniciar en modo BLE (bajo consumo por defecto)
  startBLE();
  
  Serial.println("[LISTO] Esperando tarjetas NFC...");
}

unsigned long lastScanTime = 0;
String lastUid = "";
const unsigned long DEBOUNCE_MS = 2000; // Evitar lecturas duplicadas

void loop() {
  // Si estamos en modo WiFi, procesar WebSocket
  if (currentMode == MODE_WIFI && wifiStarted) {
    webSocket.loop();
  }

  // Leer NFC
  String uid = readNfcUid();
  
  if (uid.length() > 0) {
    unsigned long now = millis();
    
    // Debounce: no enviar el mismo UID en menos de 2 segundos
    if (uid != lastUid || (now - lastScanTime) > DEBOUNCE_MS) {
      lastUid = uid;
      lastScanTime = now;
      
      Serial.printf("[NFC] UID detectado: %s\n", uid.c_str());
      sendUid(uid);
    }
  }

  // Pequeña pausa para ahorrar batería
  if (currentMode == MODE_BLE) {
    delay(150); // BLE: polling más lento para ahorrar batería
  } else {
    delay(50);  // WiFi: polling más rápido
  }
}

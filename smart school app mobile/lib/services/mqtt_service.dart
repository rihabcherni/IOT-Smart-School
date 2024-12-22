import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient('broker.hivemq.com', 'smartSchoolApp');
    client.logging(on: true);
    client.onDisconnected = onDisconnected;

    try {
      await client.connect();
    } catch (e) {
      print('MQTT connection failed: $e');
    }
  }

  void onDisconnected() {
    print('Disconnected from MQTT broker');
  }

  void publish(String topic, String message) {
    final builder = mqtt.MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, mqtt.MqttQos.atLeastOnce, builder.payload!);
  }
}

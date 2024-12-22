import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_school/widgets/header_auth.dart';
import 'package:smart_school/widgets/infoCard.dart';

class ClassroomMonitorScreen extends StatefulWidget {
  @override
  _ClassroomMonitorScreenState createState() => _ClassroomMonitorScreenState();
}

class _ClassroomMonitorScreenState extends State<ClassroomMonitorScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) => _checkThresholds());
  }

  double temperature = 19; // Modifiable temperature value
  double humidity = 55; // Modifiable humidity value
  bool alert = false; // Static alert example
  bool lampOn = false; // Lamp state
  bool airConditionerOn = false; // Air conditioner state
  bool heatingSystemOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: HeaderAuth(
          imageAssetPath: 'assets/logo.png',
          height: 150,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildRowWithCircularSlidersAndCards(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Classroom Control Switches',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 60, 79),
                  ),
                ),
              ),
              _buildLampAndACSwitches(),
              const SizedBox(height: 20),
              _buildSliders(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithCircularSlidersAndCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Classroom Monitor',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 2, 28, 198),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 26),
        const Text(
          'Presence',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 57, 60, 79),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StudentsDataCard(),
            const SizedBox(width: 20),
            _buildTeacherCard(),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Environmental Data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 57, 60, 79),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircularSlider("Temperature", temperature.toStringAsFixed(1),
                "˚C", "#ff8033", "#FFC300"),
            const SizedBox(width: 30),
            _buildCircularSlider("Humidity", humidity.toStringAsFixed(1), "%",
                "#0277bd", "#4FC3F7"),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularSlider(String label, String value, String unit,
      String trackColor, String progressColor,
      {double maxValue = 100}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          customWidths: CustomSliderWidths(
              trackWidth: 4, progressBarWidth: 10, shadowWidth: 40),
          customColors: CustomSliderColors(
            trackColor: HexColor(trackColor),
            progressBarColor: HexColor(progressColor),
            shadowColor: HexColor(progressColor),
            shadowMaxOpacity: 0.5,
            shadowStep: 20,
          ),
          infoProperties: InfoProperties(
            bottomLabelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            bottomLabelText: label,
            mainLabelStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            modifier: (double val) => "$value $unit",
          ),
          startAngle: 90,
          angleRange: 360,
          size: 150.0,
          animationEnabled: true,
        ),
        min: 0,
        max: maxValue,
        initialValue: double.tryParse(value) ?? 0,
      ),
    );
  }

  Widget _buildLampAndACSwitches() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Lamp'),
          value: lampOn,
          onChanged: (value) {
            setState(() {
              lampOn = value;
            });
          },
          activeColor: Colors.yellow,
          secondary: Icon(lampOn ? Icons.lightbulb : Icons.lightbulb_outline),
        ),
        SwitchListTile(
          title: const Text('Air Conditioner'),
          value: airConditionerOn,
          onChanged: (value) {
            setState(() {
              airConditionerOn = value;
            });
          },
          activeColor: Colors.blue,
          secondary:
              Icon(airConditionerOn ? Icons.ac_unit : Icons.ac_unit_outlined),
        ),
        SwitchListTile(
          title: const Text('Heating System'),
          value: heatingSystemOn,
          onChanged: (value) {
            setState(() {
              heatingSystemOn = value;
            });
          },
          activeColor: Colors.red,
          secondary: Icon(
              heatingSystemOn ? Icons.local_fire_department : Icons.fireplace),
        ),
      ],
    );
  }

  Widget _buildSliders() {
    return Column(
      children: [
        Row(
          children: [
            const Text('Temperature: '),
            Expanded(
              child: Slider(
                value: temperature,
                min: 0,
                max: 50,
                divisions: 50,
                label: temperature.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Humidity: '),
            Expanded(
              child: Slider(
                value: humidity,
                min: 0,
                max: 100,
                divisions: 100,
                label: humidity.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    humidity = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _checkThresholds() {
    List<String> alerts = [];

    if (temperature > 35) {
      alerts.add('Temperature (${temperature.toStringAsFixed(1)}˚C)');
    }
    if (humidity > 70) {
      alerts.add('Humidity (${humidity.toStringAsFixed(1)}%)');
    }

    if (alerts.isNotEmpty && !alert) {
      setState(() => alert = true);
      _showAlert(alerts);
    }
  }

  void _showAlert(List<String> alerts) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
              SizedBox(width: 10),
              Text(
                'Alerte',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(color: Colors.redAccent, thickness: 1.2),
              const SizedBox(height: 10),
              const Text(
                'Les seuils suivants ont été dépassés :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...alerts.map((alert) => Row(
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.orange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          alert,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => alert = false);
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _StudentsDataCard() {
    return InfoCard(
      label: "Number of Students",
      icon: const Image(
        image: AssetImage('assets/st.png'),
        width: 70,
      ),
      valeur: "3",
    );
  }

  Widget _buildTeacherCard() {
    return InfoCard(
      label: "Number of Teachers",
      icon: const Image(
        image: AssetImage('assets/te.png'),
        width: 70,
      ),
      valeur: "1",
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

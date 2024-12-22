import 'package:flutter/material.dart';
import 'package:smart_school/widgets/header_auth.dart';

class ParkingManagementScreen extends StatelessWidget {
  const ParkingManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: HeaderAuth(
          imageAssetPath: 'assets/logo.png',
          height: 100,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Parking Management',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 28, 198),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListTile(
                leading: Icon(Icons.close_outlined,
                    size: 50, color: Color.fromARGB(255, 246, 2, 2)),
                title: Text(
                  'Occupied spaces',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  'Spaces: 2',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            // Card for available parking spaces
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListTile(
                leading: Icon(Icons.check_circle,
                    size: 50, color: Color.fromARGB(255, 19, 165, 0)),
                title: Text(
                  'Available Spaces',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  'Spaces: 1',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            // Historical data table for car arrivals
            SizedBox(height: 20),

            Image(
              image: AssetImage('assets/car.png'),
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

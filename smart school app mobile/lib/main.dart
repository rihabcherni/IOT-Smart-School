import 'package:flutter/material.dart';
import 'package:smart_school/screens/landing.dart';
import 'package:smart_school/screens/user/home_screen.dart';
import 'package:smart_school/screens/auth/register_screen.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/user/parking_management.dart';
import 'screens/user/classroom_monitor.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(
    const SmartSchoolApp(),
  );
}

class SmartSchoolApp extends StatelessWidget {
  const SmartSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart School',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Route initiale : Landing Page
      routes: {
        '/': (_) => const LandingPage(),

        // -------------------------------------------------------------//

        '/login': (_) => LoginScreen(),
        '/register': (_) => const RegisterScreen(),

        // -------------------------------------------------------------//
        '/adminDashboard': (_) => const AdminDashboard(),

        // -------------------------------------------------------------//
        '/home': (_) => const HomeScreen(),
        '/parkingManagement': (_) => const ParkingManagementScreen(),
        '/classroomMonitoring': (_) => ClassroomMonitorScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_school/widgets/LineChartWidget.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  // Statistics Cards
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatisticCard(
                        title: 'Available Parking Spots',
                        value: '12',
                        icon: Icons.local_parking,
                        color: Colors.green,
                      ),
                      StatisticCard(
                        title: 'Occupied Parking Spots',
                        value: '8',
                        icon: Icons.car_rental,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatisticCard(
                        title: 'Total Devices Connected',
                        value: '25',
                        icon: Icons.devices_other,
                        color: Color.fromARGB(255, 0, 17, 171),
                      ),
                      StatisticCard(
                        title: 'Active Classrooms',
                        value: '10',
                        icon: Icons.class_,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Chart Section
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Parking Occupancy Trends',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Expanded(
                              child: LineChartWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';

// class AdminDashboard extends StatelessWidget {
//   const AdminDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Dashboard')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Welcome, Admin!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: [
//                   // Parking Overview
//                   DashboardCard(
//                     title: 'Parking Status',
//                     icon: Icons.local_parking,
//                     description: 'View available and occupied spots.',
//                     onTap: () {
//                       Navigator.pushNamed(context, '/parkingManagement');
//                     },
//                   ),
//                   // Classroom Monitoring Overview
//                   DashboardCard(
//                     title: 'Classroom Monitoring',
//                     icon: Icons.class_,
//                     description: 'Monitor classroom devices.',
//                     onTap: () {
//                       Navigator.pushNamed(context, '/classroomMonitoring');
//                     },
//                   ),
//                   // Device Management Overview
//                   DashboardCard(
//                     title: 'Device Control',
//                     icon: Icons.devices_other,
//                     description: 'Manage connected devices.',
//                     onTap: () {
//                       Navigator.pushNamed(context, '/deviceControl');
//                     },
//                   ),
//                   // Settings
//                   DashboardCard(
//                     title: 'Settings',
//                     icon: Icons.settings,
//                     description: 'Modify system settings.',
//                     onTap: () {
//                       Navigator.pushNamed(context, '/settings');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashboardCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String description;
//   final VoidCallback onTap;

//   const DashboardCard({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.description,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 48, color: Color.fromARGB(255, 0, 17, 171)),
//               const SizedBox(height: 16),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



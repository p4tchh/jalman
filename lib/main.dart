import 'package:flutter/material.dart';
import 'src/screens/dashboard/user_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          background: Colors.grey[100],
        ),
        useMaterial3: true,
      ),
      home: const UserDashboard(),
    );
  }
}

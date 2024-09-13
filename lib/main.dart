import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(JobExplorerApp());
}

class JobExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Explorer',
      theme: ThemeData(
        primaryColor: Color(0xFF80EFDE), // Set theme color to 80EFDE
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}

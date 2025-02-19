import 'package:flutter/material.dart';
import 'package:kiosk/Screens/welcome.dart';

void main() {
  runApp(KioskApp());
}

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

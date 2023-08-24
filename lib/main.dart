import 'package:flutter/material.dart';
import 'package:iti_23_g2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Material App >> Scafold
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}



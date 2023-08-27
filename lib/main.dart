import 'package:flutter/material.dart';
import 'package:iti_23_g2/ecommerce/onboarding/onboarding_one.dart';
import 'package:iti_23_g2/test_apps/test1.dart';

void main() {
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingOne(),
    );
  }
}

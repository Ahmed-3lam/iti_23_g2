import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/bmi/bmi_screen.dart';
import 'package:iti_23_g2/ecommerce/onboarding/onboarding.dart';
import 'package:iti_23_g2/ecommerce/splash/splash_screen.dart';
import 'package:iti_23_g2/test_apps/test1.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'ecommerce/auth/auth_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}

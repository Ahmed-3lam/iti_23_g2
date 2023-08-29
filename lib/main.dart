import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/ecommerce/main/main_screen.dart';
import 'package:iti_23_g2/ecommerce/splash/splash_screen.dart';

import 'ecommerce/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

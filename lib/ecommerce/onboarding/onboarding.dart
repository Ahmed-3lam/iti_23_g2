import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/ecommerce/auth/auth_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  String title = "Browse all the category";
  String description =
      "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .";

  String image = "assets/images/boarding1.png";
  String skipBtn = "assets/images/skip_btn1.png";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  _changeOnBoarding();
                },
                child: Container(
                    height: 90, width: 90, child: Image.asset(skipBtn)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeOnBoarding() {
    if (index < 2) {
      index++;
      title = titleList[index];
      description = descList[index];
      image = "assets/images/boarding${index + 1}.png";
      skipBtn = "assets/images/skip_btn${index + 1}.png";
      setState(() {});
    } else {
      Get.to(const AuthScreen(),
          curve: Curves.easeOutBack, duration: Duration(seconds: 1));
    }
  }
}

List titleList = [
  "Browse all the category",
  "Amazing Discounts & Offers",
  "Delivery in 30 Min",
];
List descList = [
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
];

import 'package:flutter/material.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
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
    index++;
    title = titleList[index];
    description = descList[index];
    image = "assets/images/boarding${index + 1}.png";
    skipBtn = "assets/images/skip_btn${index + 1}.png";

    setState(() {});
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

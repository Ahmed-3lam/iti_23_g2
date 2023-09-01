import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iti_23_g2/const.dart';
import 'package:iti_23_g2/ecommerce/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: HomeController.photo == null
                      ? Image.network(
                          banner1,
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          HomeController.photoFile!,fit: BoxFit.fill,
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Packs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => _itemBuilder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our new item",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => _itemBuilder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder() {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.5), width: .5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
              height: 100, width: 100, child: Image.network(productImage1)),
          const Row(
            children: [
              Text(
                "Vegetables",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Row(
            children: [
              Text(
                "is fresh and good",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Row(
            children: [
              Text(
                "\$35",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "\$50",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
              Spacer(),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

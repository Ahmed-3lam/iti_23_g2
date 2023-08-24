import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "World",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  CupertinoIcons.lock_open_fill,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Image.network(avatarImage,height: 100,width: 100,),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatarImage),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

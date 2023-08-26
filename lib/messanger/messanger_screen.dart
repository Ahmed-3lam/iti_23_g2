import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(top: 8.0,left: 8),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar1.jpg"),
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 25
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.5),
              child: Icon(CupertinoIcons.camera_fill,color: Colors.black,)),
          SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.5),
              child: Icon(Icons.edit,color: Colors.black,)),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}

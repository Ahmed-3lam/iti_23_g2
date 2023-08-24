import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _customChats(
              icon: Icons.lock,
              text: "Locked Chats",
            ),
            SizedBox(
              height: 20,
            ),
            _customChats(
                icon: Icons.archive, text: "Archive", countMessages: "20"),

          ],
        ),
      ),
    );
  }

  Widget _customChats({
    required IconData icon,
    required String text,
    String? countMessages,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (countMessages != null) Spacer(),
        if (countMessages != null)
          Text(
            countMessages,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}

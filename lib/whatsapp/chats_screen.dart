import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_23_g2/whatsapp/models/chat_model.dart';
import 'package:iti_23_g2/whatsapp/widgets/custom_chats.dart';

import 'json_files/chats_json.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(CupertinoIcons.chat_bubble_text_fill),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomChats(
              icon: Icons.lock,
              text: "Locked Chats",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomChats(
              icon: Icons.archive,
              text: "Archive",
              countMessages: "20",
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount:chatsList.length,
                
                itemBuilder: (context, index) => _chatItem(
                    name: chatsList[index].name ?? "",
                    message: chatsList[index].message??"hhh",
                    createdAt: chatsList[index].createdAt ?? "",
                    image: chatsList[index].image ?? "",
                    messageType: chatsList[index].messageType!),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String createdAt,
    required String image,
    required ChatType messageType,
  }) {
    return
      Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _messageTypeBuilder(message, messageType),
              ],
            ),
            const Spacer(),
            Text(
              createdAt,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _messageTypeBuilder(String message, ChatType messageType) {
    if (messageType == ChatType.MESSAGE) {
      return Text(
        message,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      );
    } else if (messageType == ChatType.VIDEO) {
      return Row(
        children: [
          Icon(
            CupertinoIcons.video_camera_solid,
            color: Colors.grey,
          ),
          Text(
            "Video",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(
            Icons.gif,
            color: Colors.grey,
          ),
          Text(
            "GIF",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      );
    }
  }

  List<ChatModel> chatsList =
      whatsAppChats.map((e) => ChatModel.fromJson(e)).toList();
}

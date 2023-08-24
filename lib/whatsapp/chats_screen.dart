import 'package:flutter/material.dart';
import 'package:iti_23_g2/const.dart';
import 'package:iti_23_g2/whatsapp/models/chat_model.dart';
import 'package:iti_23_g2/whatsapp/widgets/custom_chats.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) => _chatItem(
                  name: names[index].name,
                  message: names[index].message,
                  createdAt: names[index].createdAt,
                  image: names[index].image,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String createdAt,
    required String image,
  }) {
    return Column(
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
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                // Row(
                //   children: [
                //     Icon(
                //       CupertinoIcons.video_camera_solid,
                //       color: Colors.grey,
                //     ),
                //     Text(
                //       "Video",
                //       style: TextStyle(
                //         fontSize: 13,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
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

  List<ChatModel> names = [
    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),    ChatModel(name: "Ahmed", message: "Hello", createdAt: "11:39 PM",image: avatarImage),
    ChatModel(name: "Mohamed", message: "Welcome", createdAt: "12:39 PM",image: avatarImage2),
  ];
}

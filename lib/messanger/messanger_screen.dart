import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_23_g2/const.dart';
import 'package:iti_23_g2/messanger/models/messanger_model.dart';

import 'json/messanger_json.dart';

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MessangerModel> apiList =
        messangerJson.map((e) => MessangerModel.fromJson(e)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchBuilder(),
              const SizedBox(
                height: 20,
              ),
              _storiesBuilder(),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: apiList.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => _buildChatItem(
                  image: apiList[index].image ?? "",
                  name: apiList[index].name ?? "",
                  message: apiList[index].message ?? "",
                  icon: apiList[index].icon!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String image,
    required String name,
    required String message,
    required IconType icon,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        ),
        Spacer(),
        Container(
          width: 14,
            height: 14,
            child: _iconTypeBuilder(icon)),
      ],
    );
  }

  Widget _iconTypeBuilder(IconType icon) {
    if (icon == IconType.CHECK_ICON) {
      return Icon(
        CupertinoIcons.check_mark_circled,
        color: Colors.grey,
        size: 16,
      );
    } else if (icon == IconType.CIRCLE_AVATER) {
      return CircleAvatar(
        radius: 5,
      );
    } else {
      return CircleAvatar(
        radius: 8,
        backgroundImage: NetworkImage(avatarImage2),
      );
    }
  }

  Widget _searchBuilder() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Text("Search")
        ],
      ),
    );
  }

  Widget _storiesBuilder() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[400],
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            Text("Your story")
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 80,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 100,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 26,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(avatarImage),
                          ),
                        ),
                      ),
                      Text("Ahmed")
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 8),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar1.jpg"),
        ),
      ),
      title: const Text(
        "Chats",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
      ),
      actions: [
        _buildAppBarAction(CupertinoIcons.camera_fill),
        const SizedBox(
          width: 10,
        ),
        _buildAppBarAction(Icons.edit),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _buildAppBarAction(IconData icon) {
    return CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(.5),
        child: Icon(
          icon,
          color: Colors.black,
        ));
  }
}

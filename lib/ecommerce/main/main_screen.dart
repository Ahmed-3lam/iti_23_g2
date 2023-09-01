import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iti_23_g2/const.dart';
import 'package:iti_23_g2/ecommerce/home/home_controller.dart';
import 'package:iti_23_g2/ecommerce/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  List _screens = [
    HomeScreen(),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "menu",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "shopping_cart",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "person",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                  child: Image.network(avatarImage)),
            ),
            ListTile(
              title: const Text('Home'),
             minLeadingWidth: 0,
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text('Cart'),
              minLeadingWidth: 0,
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.withOpacity(.2),
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.menu, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          _index = index;
          setState(() {});
        },
      ),
      body: _screens[_index],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: _buildAppBarTitle(),
      actions: [
        InkWell(
          onTap: ()async{
          HomeController.pickPicture();

          },
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Padding _buildAppBarTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0),
      child: Row(
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: Image.asset("assets/images/Location.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Monofia",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.green,
                  )
                ],
              ),
              Text(
                "Madinat Elsadat",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iti_23_g2/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset("assets/images/banner1.png"),
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
                separatorBuilder: (context,index)=>SizedBox(width: 10,),
                itemBuilder: (context,index)=>_itemBuilder(),

              ),
            ),
            SizedBox(height: 20,),

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
                separatorBuilder: (context,index)=>SizedBox(width: 10,),
                itemBuilder: (context,index)=>_itemBuilder(),

              ),
            ),

          ],
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      title: _buildAppBarTitle(),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(
            Icons.search,
            color: Colors.black,
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

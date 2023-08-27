import 'package:flutter/material.dart';
import 'package:iti_23_g2/const.dart';

class TestOneScreen extends StatefulWidget {
  const TestOneScreen({super.key});

  @override
  State<TestOneScreen> createState() => _TestOneScreenState();
}

class _TestOneScreenState extends State<TestOneScreen> {
  var image=avatarImage;
  _changeImage(){
    if(image==avatarImage){
      image=avatarImage2;

    }else{
      image=avatarImage;
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:_changeImage,
        
      ),
      body: Center(
        child: Container(
          height: 200,
            width: 200,
            child: Image.network(image)),
      ),
    );
  }
}

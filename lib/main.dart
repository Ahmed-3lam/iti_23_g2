import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';

import 'package:iti_23_g2/note_app/notes_screen.dart';
import 'package:hive/hive.dart';



void main() async{

  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

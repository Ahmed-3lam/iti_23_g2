import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_23_g2/note_app/cubit/note_cubit.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';


import 'note_app/notes_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getNotes(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesScreen(),
      ),
    );
  }
}

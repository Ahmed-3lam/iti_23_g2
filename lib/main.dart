import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';
import 'package:iti_23_g2/posts/cubit/posts_cubit.dart';
import 'package:iti_23_g2/posts/posts_screen.dart';
import 'bloc_observer.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  Bloc.observer=AppBlocObserver();
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getPosts(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}

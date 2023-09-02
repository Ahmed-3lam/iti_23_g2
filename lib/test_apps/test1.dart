import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/test_one_cubit.dart';

class TestOneScreen extends StatelessWidget {
  TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TestOneCubit>();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            cubit.changeImage();
            print("Hello");
          }),
      body: Center(
        child: BlocBuilder<TestOneCubit, TestOneState>(
          builder: (context, state) {
            return Container(
                height: 200, width: 200, child: Image.network(cubit.image));
          },
        ),
      ),
    );
  }
}

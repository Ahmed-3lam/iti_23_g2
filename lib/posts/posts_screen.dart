import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/posts_cubit.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          final cubit = context.read<PostsCubit>();
          if(state is PostsLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is PostsErrorState){
            return Center(
              child: Text(
                "ERRor",
                style: TextStyle(fontSize: 50),
              ),
            );
          }
          return ListView.builder(
              itemCount: cubit.posts.length,
              itemBuilder: (context, index) =>
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.green.withOpacity(.5),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(cubit.posts[index].title ?? ""),
                          Text(cubit.posts[index].userId.toString()),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }


}

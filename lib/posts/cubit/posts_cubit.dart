import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:iti_23_g2/posts/model/post_model.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<PostModel> posts = [];

  void getPosts() async {
    emit(PostsLoadingState());
    try {
      var response =
          await Dio().get("https://student.valuxapps.com/api/login");
      List json = response.data;
      posts = json.map((e) => PostModel.fromJson(e)).toList();
      emit(PostsSuccessState());
    } catch (e) {
      print(e.toString());
      emit(PostsErrorState());
    }
  }
}

// Design Pattern MVVM
// Singleton
// Model- View- View MODEL;
// Head first Design Pattern
// plurasight
/// MVC
/// MODEL - VIEW - CONTROLLER

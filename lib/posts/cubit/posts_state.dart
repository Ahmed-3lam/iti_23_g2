part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class PostsLoadingState extends PostsState {}
class PostsSuccessState extends PostsState {}
class PostsErrorState extends PostsState {}


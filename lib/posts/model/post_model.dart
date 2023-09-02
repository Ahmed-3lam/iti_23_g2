class PostModel {
  num? userId;
  num? id;
  String? title;
  String? body;

  PostModel({this.title, this.body, this.id, this.userId});

  PostModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}



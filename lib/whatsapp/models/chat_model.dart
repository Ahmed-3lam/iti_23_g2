class ChatModel {
   String? name;
   String? message;
   String? createdAt;
   String? image;
   ChatType? messageType;

  ChatModel({
    required this.name,
    required this.message,
    required this.createdAt,
    required this.image,
    required this.messageType,
  });

  ChatModel.fromJson(Map json){
    name=json["name"];
    message=json["message"];
    createdAt=json["createdAt"];
    image=json["image"];
    if(json["messageType"]=="message"){
      messageType=ChatType.MESSAGE;
    }else if(json["messageType"]=="video"){
      messageType=ChatType.VIDEO;
    }else{
      messageType=ChatType.GIF;
    }

  }
}

enum ChatType{
  MESSAGE,
  VIDEO,
  GIF,
}

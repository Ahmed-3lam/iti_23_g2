import 'package:flutter/cupertino.dart';

class MessangerModel {
  String? name;
  String? image;
  String? message;
  IconType? icon;

  MessangerModel({
    required this.name,
    required this.image,
    required this.message,
    required this.icon,
  });

  MessangerModel.fromJson(Map json) {
    name = json["name"];
    image = json["image"];
    message = json["message"];
    print("=============================="+json["icon"]);
    if(json["icon"]=="received"){
      icon=IconType.CHECK_ICON;
    }else if(json["icon"]=="read"){
      icon=IconType.PICTURE_IMAGE;
    }else{
      icon=IconType.CIRCLE_AVATER;
    }

  }
}

enum IconType{
  CHECK_ICON,
  CIRCLE_AVATER,
  PICTURE_IMAGE,
}

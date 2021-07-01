import 'package:flutter/foundation.dart';

class UserClass {
  UserClass(
      {@required this.name,
      @required this.description,
      @required this.imageURL,
      @required this.email});
  String name;
  String description;
  String userId;
  String imageURL;
  String email;
  String phone;
  String photo;

  UserClass.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    userId = json['userId'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
  }
}

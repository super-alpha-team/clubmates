import 'package:flutter/foundation.dart';

class ClubClass {
  ClubClass(
      {@required this.name,
      @required this.type,
      @required this.description,
      @required this.imageURL,
      this.role});
  final String name;
  final String type;
  final String description;
  final String imageURL;
  String role;
}

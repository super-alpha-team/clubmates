import 'package:flutter/foundation.dart';

class UserClass {
  UserClass({
    @required this.name,
    @required this.description,
    @required this.imageURL,
  });
  final String name;
  final String description;
  final String imageURL;
}

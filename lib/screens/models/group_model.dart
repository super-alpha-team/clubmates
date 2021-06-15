import 'package:flutter/foundation.dart';

class GroupClass {
  GroupClass(
      {@required this.name,
      @required this.type,
      @required this.description,
      @required this.imageURL,
      @required this.pinned,
      this.role});
  final String name;
  final String type;
  final String description;
  final String imageURL;
  final bool pinned;
  String role;
}

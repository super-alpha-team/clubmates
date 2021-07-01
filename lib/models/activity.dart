
class Activity{
  String category;
  int memberQuantity;
  int groupQuantity;
  DateTime createAt;
  String name;
  String description;
  String photo;
  String clubGroup;
  String club;
  bool isPublic;
  String id;

  Activity.fromJson(dynamic json) {
    category = json['category'];
    memberQuantity = json['memberQuantity'];
    groupQuantity = json['groupQuantity'];
    createAt = DateTime.parse(json['createAt'].toString());
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    clubGroup = json['clubGroup'];
    club = json['club'];
    isPublic = json['isPublic'];
    id = json['id'];
  }
}
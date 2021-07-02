
class Club {
  String category;
  int memberQuantity;
  int groupQuantity;
  int activityQuantity;
  DateTime createAt;
  String id;
  String name;
  String description;
  String photo;

  Club.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    memberQuantity = json['memberQuantity'];
    groupQuantity = json['groupQuantity'];
    activityQuantity = json['activityQuantity'];
    print('CreateAt ${json['createAt']} ${json['id']}');
    createAt = DateTime.parse(json['createAt'].toString());
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
  }
}
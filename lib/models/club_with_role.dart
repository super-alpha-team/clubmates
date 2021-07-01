class ClubRole {
  String role;
  String category;
  int memberQuantity;
  int groupQuantity;
  int activityQuantity;
  DateTime createAt;
  String id;
  String name;
  String description;
  String photo;

  ClubRole.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    final data = json['club'];
    category = data['category'];
    memberQuantity = data['memberQuantity'];
    groupQuantity = data['groupQuantity'];
    activityQuantity = data['activityQuantity'];
    createAt = DateTime.parse(data['createAt'].toString());
    id = data['id'];
    name = data['name'];
    description = data['description'];
    photo = data['photo'];
  }
}

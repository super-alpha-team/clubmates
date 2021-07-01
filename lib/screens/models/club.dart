class Club {
  // "category": "Phong trào",
  //               "memberQuantity": 2,
  //               "groupQuantity": 0,
  //               "activityQuantity": 0,
  //               "createAt": "2021-06-27T17:52:27.098Z",
  //               "_id": "60d8bcbc4c8a68111a4e85dd",
  //               "name": "CLB của admin",
  //               "description": "Câu  lạc bộ",
  //               "photo": "https://via.placeholder.com/150?text=C",
  //               "__v": 0,
  //               "id": "60d8bcbc4c8a68111a4e85dd"

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
    createAt = DateTime.parse(json['createAt'].toString());
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
  }
}

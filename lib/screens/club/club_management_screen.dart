import 'package:clubmate/screens/models/club_model.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';
import 'package:clubmate/components/club_list_tile.dart';

class ClubManagementScreen extends StatelessWidget {
  final List<ClubClass> clubs = [
    ClubClass(
      name: "CLB Tổ xung kích",
      type: "CLB phong trào",
      description: "",
      imageURL:
          "https://mario.wiki.gallery/images/e/e0/25th_Anniversary_Logo.jpg",
      role: "Ban điều hành",
    ),
    ClubClass(
      name: "CLB Design ITUS",
      type: "CLB học thuật",
      description: "",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/commons/7/7e/Falanster_logo_300x300.png",
      role: "Thành viên",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          UserNavBar(
              name: "Minh Nhut",
              role: "-a-",
              imageURL:
                  "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 15, 8, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Các câu lạc bộ của bạn",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.add,
                  size: 28,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: clubs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/club');
                        },
                        child: ClubListTile(
                            imageURL: clubs[index].imageURL,
                            description: clubs[index].description,
                            name: clubs[index].name,
                            type: clubs[index].role),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}

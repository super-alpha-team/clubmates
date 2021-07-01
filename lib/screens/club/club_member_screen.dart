import 'package:clubmate/components/user_list_tile.dart';
import 'package:clubmate/screens/club/components/club_header.dart';
import 'package:clubmate/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';

class ClubMemberManamentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          UserNavBar(
              name: "Minh Nhut",
              role: "-a-",
              imageURL:
                  "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          right: 8,
          left: 8,
        ),
        child: Column(
          children: [
            ClubHeader(
                name: "DESIGN ITUS",
                type: "CLB học thuật",
                feature: "Thành viên"),
            Expanded(child: _ClubMemberManamentAction()),
          ],
        ),
      ),
    );
  }
}

class _ClubMemberManamentAction extends StatelessWidget {
  final List<UserClass> users = [
    UserClass(
        name: "Nguyễn Xuân Mai",
        description: "mô tả về thành viên này",
        imageURL: "https://via.placeholder.com/300.png/?text=Mai"),
    UserClass(
        name: "Phạm Văn Minh Nhựt",
        description: "mô tả về thành viên này",
        imageURL: "https://via.placeholder.com/300.png/09f/fff?text=Nhut"),
    UserClass(
        name: "Đinh Phan Kim Ngân",
        description: "mô tả về thành viên này",
        imageURL: "https://via.placeholder.com/300.png/029/fff/?text=Ngan"),
  ];
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8, 15, 8, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tất cả thành viên",
                style: Theme.of(context).textTheme.headline2,
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
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: UserListTile(
                      detail: users[index].description,
                      imageURL: users[index].imageURL,
                      name: users[index].name,
                    ));
              }),
        ),
      ],
    );
  }
}

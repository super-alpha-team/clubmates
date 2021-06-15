import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/screens/club/components/club_header.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';

class ClubGroupManagementScreen extends StatelessWidget {
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
              }),
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
                  feature: "Ban/Nhóm"),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 15, 8, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tất cả Ban/nhóm",
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
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/group/home');
                                },
                                child: ClubListTile(
                                  type: "câu lạc bộ type",
                                  imageURL:
                                      "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
                                  name: "Nguyễn Xuân Mai",
                                  description: '',
                                ),
                              ));
                        }),
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}

import 'package:clubmate/components/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';

class GroupMemberManamentScreen extends StatelessWidget {
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Design ITUS",
                        style: Theme.of(context).textTheme.headline1),
                    Text(
                      "Câu lạc bộ học thuật",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Câu lạc bộ Design ITUS trực thuộc khoa Công nghệ thông tin trường đại học Khoa học tự nhiên",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
              Expanded(child: GroupMemberManamentAction()),
            ],
          ),
        ));
  }
}

class GroupMemberManamentAction extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Text(
                  "Tất cả thành viên Câu lạc bộ",
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            )),
        Expanded(
          child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: UserListTile(
                      detail: "mô tả về thành viên này",
                      imageURL:
                          "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
                      name: "Nguyễn Xuân Mai",
                    ));
              }),
        ),
      ],
    );
  }
}

import 'package:clubmate/components/group_activity_list_tile.dart';
import 'package:clubmate/components/target_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';
import 'package:clubmate/components/button_navigate_button.dart';

class ActivityGroupSlashScreen extends StatelessWidget {
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ban hậu cần",
                        style: Theme.of(context).textTheme.headline1),
                    Text(
                      "Câu lạc bộ Design ITUS",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Ban hậu cần là nơi các bạn sẽ chạy sấp mặt vì các deadline ngả ngửa đột ngột của các bạn trong câu lạc bộ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
              Expanded(child: ActivityGroupSlashAction()),
            ],
          ),
        ));
  }
}

class ActivityGroupSlashAction extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      "Các hoạt động",
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                )),
            Expanded(
              child: ListView.builder(
                  // padding: const EdgeInsets.all(8),

                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: InkWell(
                        child: TargetListTile(
                          // percentComplete: 10,
                          // numTasks: 20,
                          numTasks: 20,
                          numMembers: 50,
                          percentComplete: 50,
                          name: "Tên hoạt động",
                          // clubImageURL:
                          //     'https://homepages.cae.wisc.edu/~ece533/images/airplane.png',
                        ),
                        // onTap: () =>
                        //     {Navigator.pushNamed(context, "/activity")},
                      ),
                    );
                  }),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    "Quản lý chung",
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 5,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Container(
            //               child: DetailNavigateButton(
            //             text: 'Chức năng $index',
            //             onPressed: () {},
            //           ));
            //         }))
            Expanded(
                child: ListView(
              children: [
                Container(
                    child: DetailNavigateButton(
                  text: 'Cập nhật thông tin Ban',
                  onPressed: () {},
                )),
                Container(
                  child: DetailNavigateButton(
                    text: "Cập nhật thành viên",
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/group/member');
                    },
                  ),
                ),
                Container(
                  child: DetailNavigateButton(
                    text: "Cập nhật hoạt động",
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/group/activity');
                    },
                  ),
                ),
                // Container(
                //   child: DetailNavigateButton(
                //     text: "Thống kê báo cáo",
                //     onPressed: () {
                //       // Navigate to the second screen using a named route.
                //       Navigator.pushNamed(context, '/report');
                //     },
                //   ),
                // )
              ],
            ))
          ],
        )
      ],
    );
  }
}

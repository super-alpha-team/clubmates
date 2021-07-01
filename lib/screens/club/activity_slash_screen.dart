import 'package:clubmate/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/components/button_navigate_button.dart';

class ActivitySlashScreen extends StatelessWidget {
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
                      Text("Tên hoạt động",
                          style: Theme.of(context).textTheme.headline1),
                      // Text(
                      //   "Câu lạc bộ học thuật",
                      //   style: Theme.of(context).textTheme.subtitle1,
                      // ),
                      Text(
                        "Mô tả cho hoạt động này là như thế đó",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2,
                      )
                    ],
                  ),
                  // child: Text("adsf"),
                ),
                Expanded(child: _ActivitySlashAction()),
              ],
            )));
  }
}

class _ActivitySlashAction extends StatelessWidget {
  final List<GroupClass> groups = [
    GroupClass(
        name: "DESGIN ITUS - main",
        type: "Ban chính",
        description: "Câu lạc bộ Design ITUS",
        pinned: true,
        imageURL:
            "https://via.placeholder.com/300.png/09f/fff?text=DESIGN+ITUS"),
    GroupClass(
        name: "Ban video",
        type: "Ban hoạt động",
        description: "Xây dựng các video cho clb",
        imageURL: "https://via.placeholder.com/300.png/054/fff/?text=VIDEO",
        pinned: false)
  ];
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
                      "Các Ban trong hoạt động",
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                )),
            Expanded(
              child: ListView.builder(
                  // padding: const EdgeInsets.all(8),

                  itemCount: groups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 15),
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/activity/home');
                            },
                            child: ClubListTile(
                              description: groups[index].description,
                              name: groups[index].name,
                              imageURL: groups[index].imageURL,
                              pinned: groups[index].pinned,
                              type: groups[index].type,
                            )));
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
            Expanded(
              // child: ListView.builder(
              //     itemCount: 5,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //           child: DetailNavigateButton(
              //         text: 'Chức năng $index',
              //         onPressed: () {},
              //       ));
              //     }))
              child: ListView(
                children: [
                  Container(
                      child: DetailNavigateButton(
                    text: 'Cập nhật thông tin Câu lạc bộ',
                    onPressed: () {},
                  )),
                  Container(
                    child: DetailNavigateButton(
                      text: "Cập nhật thành viên",
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/member');
                      },
                    ),
                  ),
                  Container(
                    child: DetailNavigateButton(
                      text: "Cập nhật các ban",
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/group');
                      },
                    ),
                  ),
                  Container(
                    child: DetailNavigateButton(
                      text: "Thống kê báo cáo",
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/report');
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

// import 'package:clubmate/screens/club/club_group_manament_screen.dart';
// import 'package:flutter/material.dart';

// class ClubSlashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double textSizeNav = 12.0;
//     return Padding(
//       padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16, bottom: 8),
//       child: Column(
//         children: [
//           // Dashboard Text / Cup / Settings / Profile Picture
//           Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 4,
//                       child: Text(
//                         'Home',
//                         style: TextStyle(fontSize: 25),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                         padding: const EdgeInsets.all(0.0),
//                         icon: Icon(Icons.offline_pin),
//                         onPressed: () {
//                           // watch(auth).signOut();
//                           //Navigator.pushNamed(context, 'landing');
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                         padding: const EdgeInsets.all(0.0),
//                         icon: Icon(Icons.offline_pin),
//                         onPressed: () {
//                           // print(watch(graphics));
//                           //print(watch(dictionaryProvider));
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Icon(Icons.favorite),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           // Greeting Text
//           Padding(
//             padding: const EdgeInsets.only(top: 0.0),
//             child: Align(
//               child: Text(
//                 'おはよう！',
//                 style: TextStyle(fontSize: 24),
//               ),
//               alignment: Alignment.centerLeft,
//             ),
//           ),

//           // TabBar
//           TabBar(
//             indicatorPadding: EdgeInsets.only(top: 0),
//             labelPadding: EdgeInsets.symmetric(horizontal: 2),
//             indicatorColor: Color(0xFFEE892C),
//             labelStyle: TextStyle(fontSize: textSizeNav),
//             tabs: [
//               Tab(text: 'Overview'),
//               Tab(text: 'Decks'),
//               Tab(text: 'Games'),
//               Tab(text: 'Statistics'),
//             ],
//             // controller: TabController(initialIndex: 0, v),
//           ),

//           // Tab Bar Items
//           Expanded(
//             child: TabBarView(children: [
//               ClubGroupManamentScreen()
//               // OverviewTab(user: user),
//               // DecksTab(),
//               // games(context),
//               // StatisticsTab(),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }

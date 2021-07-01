import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/components/button_navigate_button.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/screens/models/user_model.dart';
import 'package:clubmate/screens/personal/club_edit.dart';
import 'package:clubmate/screens/personal/personal_detail.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PersonalSummaryScreen extends StatefulWidget {
  PersonalSummaryScreen({Key key, @required this.user}) : super(key: key);
  final UserClass user;
  @override
  State<StatefulWidget> createState() => _PersonalSummaryScreenState();
}

class _PersonalSummaryScreenState extends State<PersonalSummaryScreen> {
  UserClass _user = null;
  @override
  Widget build(BuildContext context) {
    _user = widget.user;
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 330.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: CircleAvatar(
                          // backgroundColor: ColorStyles.lightOrange,
                          backgroundImage: NetworkImage(_user.photo),
                          minRadius: 40,
                          maxRadius: 50,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 7, bottom: 7),
                          child: Text(
                            _user.name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        child: DetailNavigateButton(
                          text: "Cập nhật thông tin cá nhân",
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                      ),
                      Container(
                        child: DetailNavigateButton(
                          text: "Xem danh sách công việc",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ClubDetail(text: "Design ITUS")));
                          },
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 10,
                              ),
                              width: 40,
                            ),
                            Text("Các câu lạc bộ của bạn"),
                            Expanded(
                              child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: InkWell(
                        highlightColor: ColorStyles.black,
                        child: ClubListTile(
                          imageURL:
                              'https://cdn.icon-icons.com/icons2/2248/PNG/512/cat_icon_138789.png',
                          description: '',
                          name: "name",
                          type: "",
                          color: ColorStyles.pink,
                          role: "Quan ly",
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClubDetail(text: "Design ITUS")));
                        }),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        )
        //   Column(children: [

        //     Column( child: Container(
        //           margin: EdgeInsets.only(bottom: 5),
        //           child: ClubListTile(
        //             imageURL:
        //                 'https://cdn.icon-icons.com/icons2/2248/PNG/512/cat_icon_138789.png',
        //             description: '',
        //             name: "name",
        //             type: "",
        //             color: ColorStyles.pink,
        //             role: "Quan ly",
        //           ),
        //         );
        //       },
        //       itemCount: 3,
        //     ),
        //   ]),
        // ),
        );
  }
}

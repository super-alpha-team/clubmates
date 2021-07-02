import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/components/button_navigate_button.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/main.dart';
import 'package:clubmate/models/club.dart';
import 'package:clubmate/models/club_with_role.dart';
import 'package:clubmate/models/user_model.dart';
import 'package:clubmate/screens/personal/club_edit.dart';
import 'package:clubmate/screens/personal/personal_detail.dart';
import 'package:clubmate/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalSummaryScreen extends StatefulWidget {
  PersonalSummaryScreen({
    Key key,
    @required this.user,
    @required this.clubs,
  }) : super(key: key);
  final UserClass user;
  List<ClubRole> clubs;
  @override
  State<StatefulWidget> createState() => _PersonalSummaryScreenState();
}

class _PersonalSummaryScreenState extends State<PersonalSummaryScreen> {
  UserClass _user;
  List<ClubRole> clubs;
  @override
  void initState() {
    super.initState();
    clubs = widget.clubs;
  }

  @override
  Widget build(BuildContext context) {
    _user = widget.user;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      // color: ColorStyles.red,
                      margin: EdgeInsets.only(top: 25, right: 15),
                      alignment: Alignment.centerRight,
                      // child: Wrap(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         // SharedPreferences sharedPreferences =
                      //         //     await SharedPreferences.getInstance();
                      //         // await sharedPreferences.clear();
                      //         _googleSignIn.disconnect();
                      //       },

                      //       // icon: Icon(Icons.logout),
                      //     ),
                      child: InkWell(
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Icon(Icons.logout),
                        ),
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          await sharedPreferences.clear();
                        },
                      ),
                      // ],
                      // ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(top: 50),
                      child: CircleAvatar(
                        // backgroundColor: ColorStyles.lightOrange,
                        backgroundImage: NetworkImage(_user?.photo ??
                            "https://d338t8kmirgyke.cloudfront.net/icons/icon_pngs/000/004/088/original/user.png"),
                        minRadius: 40,
                        maxRadius: 50,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7),
                        child: Text(
                          _user?.name ?? "",
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
                          Navigator.pushNamed(context, '/task');
                        },
                      ),
                    ),
                    Container(
                      child: DetailNavigateButton(
                        text: "Đăng xuất",
                        onPressed: signOut,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
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
                final club = clubs[index];
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: GestureDetector(
                      child: ClubListTile(
                        imageURL: club.photo,
                        description: club.description,
                        name: club.name,
                        type: club.category,
                        color: ColorStyles.fromCategory(club.category),
                        // role: club.role,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClubDetail(club: club)));
                      }),
                );
              },
              childCount: clubs.length,
            ),
          ),
        ],
      ),
    );
  }

  void signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("loggedIn", false);
    navigateToSignIn();
  }

  void navigateToSignIn() {
    final router = MaterialPageRoute(
      builder: (context) => SignInScreen(),
    );
    // Navigator.of(context).pushAndRemoveUntil(router, (route) => true);
    Navigator.of(context, rootNavigator: true).pushReplacement(router);
  }
}

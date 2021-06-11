import 'package:clubmate/components/button_navigate_button.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/screens/personal/personal_detail.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 350.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                          backgroundColor: ColorStyles.lightOrange, radius: 70),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7),
                        child: Text(
                          'A',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      child: DetailNavigateButton(
                        text: "1",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersionalDetail()));
                        },
                      ),
                    ),
                    Container(
                      child: DetailNavigateButton(
                        text: "2",
                        onPressed: () {},
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: ClubListTile(
                      imageURL:
                          'https://cdn.icon-icons.com/icons2/2248/PNG/512/cat_icon_138789.png',
                      description: '',
                      name: "name",
                      type: "",
                      color: ColorStyles.pink,
                      role: "Quan ly",
                    ),
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

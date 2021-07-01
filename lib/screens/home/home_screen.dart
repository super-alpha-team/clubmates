import 'package:clubmate/apis/activity_api.dart';
import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/models/activity.dart';
import 'package:clubmate/models/club.dart';
import 'package:clubmate/screens/club/club_screen.dart';
import 'package:flutter/material.dart';
import '../../color_styles.dart';
import 'package:clubmate/components/notification_button.dart';
import 'package:clubmate/components/activity_list_tile.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/screens/home/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Club> allClubs = [];
  List<Activity> allActivities = [];
  int tabSelection = 0;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async {
    allClubs = await ClubAPI.instance.all();
    allActivities = await ActivityAPI.instance.all();
    setState(() {isLoading = false;});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: ColorStyles.orange,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: ColorStyles.white,
                size: 30,
              ),
              onPressed: () => print('back'),
            ),
          ),
          actions: [NotificationButton(num: 1)],
        ),
        body: SafeArea(
          child: isLoading 
          ? Center(child: CircularProgressIndicator()) 
          : SingleChildScrollView(
            child: Column(children: [
              _header(),
              tabSelection == 0 ? _activityList() : _clubList()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          child: Image(
            image: NetworkImage(
                'https://www.geeklawblog.com/wp-content/uploads/sites/528/2018/12/liprofile-656x369.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){setState(() {tabSelection = 0;});},
                  child: Column(
                    children: [
                      Text(
                        'Hoạt động',
                        style: TextStyle(
                            fontSize: 24,
                            color: ColorStyles.orange,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 4,
                        width: tabSelection == 0 ? double.infinity : 0,
                        color: ColorStyles.orange,
                        margin: EdgeInsets.only(top: 8),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){setState(() {tabSelection = 1;});},
                  child: Column(
                    children: [
                      Text(
                        'Câu lạc bộ',
                        style: TextStyle(
                            fontSize: 24,
                            color: ColorStyles.orange,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 4,
                        width: tabSelection == 1 ? double.infinity : 0, 
                        color: ColorStyles.orange,
                        margin: EdgeInsets.only(top: 8),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void clubDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ClubScreen(),
      ),
    );
  }

  Widget _clubList() {
    return Column(
      children: allClubs
          .map(
            (club) => GestureDetector(
              onTap: clubDetail,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ClubListTile(
                  imageURL: club.photo,
                  description: club.description,
                  name: club.name,
                  color: ColorStyles.fromCategory(club.category),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _activityList() {
    return Column(
      children: allActivities.map(
        (e) => ActivityListTile(
          clubImageURL: e.photo,
          imageURL: e.photo,
          name: e.name,
          description: e.description,
          color: ColorStyles.fromCategory(e.category),
        )
      )
      .toList()
    );
  }
}

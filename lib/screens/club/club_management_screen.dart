import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/screens/models/club_model.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/models/club.dart';

class ClubManagementScreen extends StatefulWidget {
  @override
  _ClubManagementScreenState createState() => _ClubManagementScreenState();
}

class _ClubManagementScreenState extends State<ClubManagementScreen> {
  bool isLoading = true;
  List<Club> clubs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getClubs();
  }

  void getClubs() async {
    clubs = await ClubAPI.instance.me();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserNavBar(
                    name: "Minh Nhut",
                    role: "-a-",
                    imageURL:
                        "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
              ],
            ),
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
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: clubs.length,
                      itemBuilder: (context, index) => ClubListTile(
                        imageURL: clubs[index].photo,
                        description: clubs[index].description,
                        name: clubs[index].name,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

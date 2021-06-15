import 'package:clubmate/screens/club/components/club_header.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/components/user_nav_bar.dart';

class ClubReportScreen extends StatelessWidget {
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
                  feature: "Báo cáo"),
              Expanded(child: ClubReportAction()),
            ],
          ),
        ));
  }
}

class ClubReportAction extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8, 15, 8, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Các báo cáo",
                style: Theme.of(context).textTheme.headline2,
              ),
              Icon(
                Icons.add,
                size: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class UserNavBar extends StatelessWidget {
  UserNavBar({
    Key key,
    @required this.name,
    @required this.role,
    @required this.imageURL,
  }) : super(key: key);

  final String name;
  final String role;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 9),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.black),
              ),
              Text(
                role,
                style: TextStyle(
                  fontSize: 16,
                  color: ColorStyles.orange,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                imageURL,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

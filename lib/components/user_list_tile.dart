import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  UserListTile({
    Key key,
    @required this.imageURL,
    @required this.name,
    @required this.detail,
  }) : super(key: key);

  final String imageURL;
  final String name;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(15, 8, 8, 15),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.black.withAlpha(100),
            blurRadius: 4,
            offset: Offset(2.5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(imageURL),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                ),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class NotificationListTile extends StatelessWidget {
  NotificationListTile({
    Key key,
    @required this.imageURL,
    @required this.title,
    @required this.subtitle,
    this.color = ColorStyles.orange,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
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
            margin: EdgeInsets.only(left: 15),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              // border: Border.all(width: 0.5, color: ColorStyles.white),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

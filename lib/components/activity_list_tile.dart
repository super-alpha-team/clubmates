import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class ActivityListTile extends StatelessWidget {
  ActivityListTile({
    Key key,
    @required this.imageURL,
    @required this.clubImageURL,
    @required this.description,
    @required this.name,
    this.color = ColorStyles.blue,
  }) : super(key: key);

  final String imageURL;
  final String clubImageURL;
  final String description;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
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
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  child: circleImage(
                    imageURL,
                    90,
                  ),
                  margin: EdgeInsets.only(right: 8)),
              circleImage(
                clubImageURL,
                30,
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorStyles.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container circleImage(String url, double diameter) {
    return Container(
      child: ClipOval(
        child: Image.network(
          url,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

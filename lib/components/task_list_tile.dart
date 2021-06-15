import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  TaskListTile({
    Key key,
    @required this.imageURL,
    @required this.name,
    @required this.deadline,
    this.color = ColorStyles.white,
  }) : super(key: key);

  final String imageURL;
  final String name;
  final String deadline;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
      decoration: BoxDecoration(
        color: color,
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
            width: 60,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  imageURL,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    style: TextStyle(
                      color: ColorStyles.darkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    deadline,
                    maxLines: 1,
                    style: TextStyle(
                      color: ColorStyles.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.navigate_next,
              size: 40,
              color: ColorStyles.darkBlue,
            ),
          )
        ],
      ),
    );
  }
}

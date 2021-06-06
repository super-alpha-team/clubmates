import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class TargetListTile extends StatelessWidget {
  TargetListTile({
    Key key,
    @required this.name,
    @required this.numMembers,
    @required this.numTasks,
    @required this.percentComplete,
  }) : super(key: key);

  final String name;
  final int numMembers;
  final int numTasks;
  final int percentComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: ColorStyles.darkBlue,
            ),
          ),
          Container(
            height: 5,
            child: Row(
              children: [
                Expanded(
                  flex: percentComplete,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                      color: ColorStyles.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 100 - percentComplete,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                      ),
                      color: ColorStyles.lightBlue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$numTasks tasks',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                width: 150,
                alignment: Alignment.centerRight,
                child: Text(
                  '$numMembers members',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

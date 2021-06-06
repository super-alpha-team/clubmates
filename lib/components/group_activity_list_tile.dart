import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class GroupActivityListTile extends StatelessWidget {
  GroupActivityListTile({
    Key key,
    @required this.name,
    @required this.description,
    @required this.imageURL,
    @required this.numMembers,
    @required this.numTargets,
  }) : super(key: key);

  final String name;
  final String description;
  final String imageURL;
  final int numMembers;
  final int numTargets;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: ColorStyles.gray),
      ),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.orange,
                        ),
                      ),
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: ColorStyles.orange,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              numInfoWidget(numMembers, 'Thành viên'),
              numInfoWidget(numTargets, 'Targets'),
              TextButton(
                onPressed: () {},
                child: Text('Xem'),
              )
            ],
          )
        ],
      ),
    );
  }

  Column numInfoWidget(int num, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          num.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

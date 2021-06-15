import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class ClubHeader extends StatelessWidget {
  ClubHeader({
    Key key,
    @required this.name,
    @required this.type,
    @required this.feature,
  }) : super(key: key);

  final String name;
  final String type;
  final String feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.name, style: Theme.of(context).textTheme.headline1),
          Text(
            this.type,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   child: Divider(
              //     height: 20,
              //     thickness: 5,
              //     indent: 20,
              //     endIndent: 20,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  // color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      ColorStyles.background,
                      ColorStyles.lightBlue,
                    ],
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.green, offset: Offset.fromDirection(-30)),
                  // ],
                ),
                // color: ColorStyles.gray,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  this.feature,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: ColorStyles.darkBlue,
                      fontSize: 24,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

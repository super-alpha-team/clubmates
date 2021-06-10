import 'package:flutter/material.dart';
import '../../color_styles.dart';

class ClubType extends StatelessWidget {
  const ClubType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: ColorStyles.lightOrange, width: 2),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(ColorStyles.white),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
                child: Text(
                  'CLB Tinh nguyen',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorStyles.darkBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
    );
  }
}

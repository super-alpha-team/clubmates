import 'package:flutter/material.dart';
import '../../color_styles.dart';

class ClubType extends StatelessWidget {
  const ClubType({
    Key key,
    @required this.text,
    @required this.color,
    @required this.icon,
  }) : super(key: key);

  final String text;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Container(
        width: 330,
        height: 75,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: ColorStyles.lightOrange),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: Text(
            text,
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

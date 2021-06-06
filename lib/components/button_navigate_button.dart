import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class DetailNavigateButton extends StatelessWidget {
  DetailNavigateButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: ColorStyles.gray,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: ColorStyles.gray,
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: ColorStyles.gray,
            )
          ],
        ),
      ),
    );
  }
}

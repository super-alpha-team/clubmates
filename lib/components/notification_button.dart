import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  NotificationButton({
    Key key,
    @required this.num,
    this.onTap,
  }) : super(key: key);

  final int num;
  final VoidCallback onTap;

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Icon(
              Icons.notifications_none,
              size: 30,
              color: ColorStyles.darkBlue,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorStyles.darkBlue,
              ), 
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  num.toString(),
                  style: TextStyle(
                    color: ColorStyles.white,
                    fontSize: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

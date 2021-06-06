import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class ClubListTile extends StatelessWidget {
  ClubListTile({
    Key key,
    @required this.imageURL,
    @required this.description,
    @required this.name,
    @required this.type,
    this.role = '',
    this.pinned = false,
    this.color = ColorStyles.orange,
  }) : super(key: key);

  final String imageURL;
  final String description;
  final String name;
  final String type;
  final String role;
  final bool pinned;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1.1, -1.2),
      children: [
        Container(
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: ClipOval(
                  child: Image.network(
                    imageURL,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorStyles.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          description,
                          maxLines: 3,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      role == '' ? Container() : Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          role,
                          style: TextStyle(
                            color: ColorStyles.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        pinned
            ? Container(
                child: Transform.rotate(
                  angle: 0.785,
                  child: Icon(
                    Icons.push_pin_outlined,
                    size: 35,
                    color: ColorStyles.darkBlue,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

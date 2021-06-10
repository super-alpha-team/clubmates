import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';
import 'package:flutter/src/widgets/icon.dart';
import '../../color_styles.dart';
import 'package:clubmate/screens/club/club_type.dart';

class CreateClubScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyles.darkBlue,
            size: 30,
          ),
          onPressed: () => print('back'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'TẠO CÂU LẠC BỘ',
                          style: TextStyle(
                            color: ColorStyles.darkOrange,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text('A Moments of Entertainment',
                          style: TextStyle(
                            color: ColorStyles.darkOrange,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: OutlinedButton(
                      onPressed: () {
                        print('create new club');
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: ColorStyles.lightOrange, width: 2),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(ColorStyles.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
                        child: Text(
                          'Tạo câu lạc bộ mới',
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorStyles.darkBlue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              'TẠO CÂU LẠC BỘ VỚI MẪU',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
//A Moments of Entertainment.

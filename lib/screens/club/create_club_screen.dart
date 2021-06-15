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
      body: Center(
        child: Column(
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
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                width: 330,
                height: 75,
                child: OutlinedButton(
                  onPressed: () {
                    print('create new club');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: ColorStyles.lightOrange, width: 2),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorStyles.white),
                  ),
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
            ),
            Text(
              'TẠO CÂU LẠC BỘ VỚI MẪU',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
            ClubType(
                text: 'CLB Tình nguyện',
                color: ColorStyles.lightPurple,
                icon: Icon(Icons.volunteer_activism, size: 20)),
            ClubType(
                text: 'CLB Âm nhạc',
                color: ColorStyles.lightOrange,
                icon: Icon(Icons.music_note)),
            ClubType(
                text: 'CLB Học thuật',
                color: ColorStyles.lightBlue,
                icon: Icon(Icons.school)),
            ClubType(
                text: 'Political',
                color: ColorStyles.pink,
                icon: Icon(Icons.policy_outlined)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 20),
              child: Text(
                'Có lời mời tham gia',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  print('');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side:
                          BorderSide(color: ColorStyles.lightOrange, width: 2),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFB99AE4)),
                ),
                child: Text(
                  'Tham gia câu lạc bộ',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorStyles.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//A Moments of Entertainment.

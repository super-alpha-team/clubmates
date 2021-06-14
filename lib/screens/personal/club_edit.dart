import 'package:clubmate/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubDetail extends StatefulWidget {
  ClubDetail({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<ClubDetail> createState() => _ClubDetailState();
}

class _ClubDetailState extends State<ClubDetail> {
  String dropdownValue = 'Học Thuật';
  @override
  Widget build(BuildContext context) {
    String clubname = widget.text;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            // InkWell(
            //   onTap: () {},
            //   child: Text("aaa"),
            // ),
            Container(
              child: CircleAvatar(
                backgroundColor: ColorStyles.lightPurple,
                radius: 80,
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 60,
              endIndent: 60,
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 60, left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,

                children: [
                  Container(
                    child: Text(
                      "Tên câu lạc bộ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                clubname,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.darkBlue),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 60,
              endIndent: 60,
              height: 30,
            ),
            Container(
              // margin: EdgeInsets.only(top: 5, bottom: 5),
              padding: EdgeInsets.only(right: 60, left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                      child: Text(
                    "Thể loại",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  )),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(right: 60, left: 60),
                alignment: FractionalOffset.centerLeft,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  iconSize: 40,
                  elevation: 16,
                  style:
                      const TextStyle(color: ColorStyles.black, fontSize: 23),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Học Thuật',
                    'Tình Nguyện',
                    'Chính trị',
                    'Âm nhạc'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            Divider(
              color: Colors.black,
              indent: 60,
              endIndent: 60,
              height: 30,
            ),
            Container(
              // margin: EdgeInsets.only(top: 5, bottom: 5),

              padding: EdgeInsets.only(right: 60, left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                    child: Text(
                      "Giới thiệu",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 5, bottom: 5),
              width: 300,
              child: Text(
                "Ban truyền thông có chức năng là xây dựng, lên ý tưởng, thiết kế các ấn phẩm truyền thông cho Câu lạc bộ.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: ColorStyles.darkBlue),
              ),
            ),

            Container(
              // margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 100,
              alignment: FractionalOffset.bottomCenter,
              child: TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(250, 40)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: Text('Cập nhật',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.darkBlue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

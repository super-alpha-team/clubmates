import 'package:clubmate/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.pink,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                    child: Text(
                      "Tên câu lạc bộ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                "Design ITUS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorStyles.blue,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 60,
              endIndent: 60,
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                    child: Text(
                      "Thể loại",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Tên",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.blue),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 60,
              endIndent: 60,
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                      child: Text(
                    "Giới thiệu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Container(child: Icon(Icons.edit)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 60, right: 60),
              child: Text(
                "Ban truyền thông có chức năng gì đó gì đó gì đó gì đó gì đó gì đó gì đó gì đó",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.blue),
              ),
            ),
            Expanded(
              child: Container(
                child: TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(250, 40)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {},
                  child: Text('Cập nhật',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

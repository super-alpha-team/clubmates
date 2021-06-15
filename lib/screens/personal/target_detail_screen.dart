import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/notification_button.dart';
import 'package:clubmate/components/task_list_tile.dart';
import 'package:clubmate/screens/personal/add_target_screen.dart';
import 'package:clubmate/screens/personal/task_detail_screen.dart';
import 'package:flutter/material.dart';

class TargetDetailScreen extends StatefulWidget {
  @override
  _TargetDetailScreenState createState() => _TargetDetailScreenState();
}

class _TargetDetailScreenState extends State<TargetDetailScreen> {
  final data = [
    {
      'image': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Đăng bài tuyển',
      'date': '20/09/2021',
      'color': Color(0xFFC9FFDB),
    },
    {
      'image': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Chốt danh sách',
      'date': '20/09/2021',
      'color': Color(0xFFFFFFFF),
    },
    {
      'image': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Duyệt CTV',
      'date': '20/09/2021',
      'color': Color(0xFFFFB8B8),
    },
    {
      'image': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Gửi mail cho CTV',
      'date': '20/09/2021',
      'color': Color(0xFFFFFFFF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: ColorStyles.darkBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Tuyển CTV',
          style: TextStyle(
            color: ColorStyles.orange,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(
                'Mục đích công việc sẽ là tuyển các cộng tác viên cho hoạt động tình nguyện',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 15,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorStyles.blue,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorStyles.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Công việc',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.darkBlue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddTargetScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: ColorStyles.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: ColorStyles.lightPurple,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: TaskListTile(
                            imageURL: data[index]['image'],
                            name: data[index]['name'],
                            deadline: data[index]['date'],
                            color: data[index]['color'],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TaskDetailScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              child: OutlinedButton(
                onPressed: () {
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFFF97078),
                ),
                child: Text(
                  'Xoá',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.white,
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

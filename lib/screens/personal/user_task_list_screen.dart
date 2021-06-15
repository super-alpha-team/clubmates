import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/notification_button.dart';
import 'package:clubmate/components/task_list_tile.dart';
import 'package:clubmate/screens/personal/task_detail_screen.dart';
import 'package:flutter/material.dart';

class UserTaskListScreen extends StatefulWidget {
  @override
  _UserTaskListScreenState createState() => _UserTaskListScreenState();
}

class _UserTaskListScreenState extends State<UserTaskListScreen> {
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
        backgroundColor: ColorStyles.orange,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: ColorStyles.darkBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          NotificationButton(
            num: 10,
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // height: 80,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            decoration: BoxDecoration(
              color: ColorStyles.orange,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorStyles.orange,
                    size: 30,
                  ),
                  hintText: 'Tìm kiếm công việc',
                  hintStyle: TextStyle(
                    color: ColorStyles.orange,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  color: ColorStyles.orange,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              'Công việc của bạn',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorStyles.darkBlue,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print(1);
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: ColorStyles.lightPurple,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
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
          ),
        ],
      ),
    );
  }
}

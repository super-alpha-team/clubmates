import 'package:clubmate/components/user_list_tile.dart';
import 'package:clubmate/screens/personal/member_management_screen.dart';
import 'package:flutter/material.dart';

import 'package:clubmate/color_styles.dart';

class TaskDetailScreen extends StatefulWidget {
  TaskDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  static final descriptionTest =
      'Soạn bài, nhận góp ý, chỉnh sửa và đăng bài Soạn bài, nhận góp ý, chỉnh sửa và đăng  ...';
  final descriptionTextFieldController = TextEditingController(
    text: descriptionTest + descriptionTest,
  );
  final descriptionTextFieldFocusNode = FocusNode();
  bool descriptionTextFieldReadOnly = true;
  List members = List.generate(
      3,
      (index) => {
            'imageURL':
                'https://image.flaticon.com/icons/png/512/4857/4857076.png',
            'name': 'Jasmine $index',
            'detail': 'Short Description',
          });

  @override
  void dispose() {
    descriptionTextFieldFocusNode.dispose();
    descriptionTextFieldController.dispose();
    super.dispose();
  }

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
          'Đăng bài tuyển',
          style: TextStyle(
            color: ColorStyles.orange,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.delete_outline_rounded,
                color: ColorStyles.red,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mô tả',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.darkBlue,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      descriptionTextFieldReadOnly ? Icons.edit : Icons.done,
                      color: ColorStyles.darkBlue,
                      size: 25,
                    ),
                    onPressed: descriptionTextFieldReadOnly
                        ? beginEdittingDescription
                        : endEdittingDescription,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 10),
              child: TextField(
                controller: descriptionTextFieldController,
                focusNode: descriptionTextFieldFocusNode,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                readOnly: descriptionTextFieldReadOnly,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 50),
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              decoration: BoxDecoration(
                color: ColorStyles.lightOrange,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Deadline',
                      style: TextStyle(
                        color: ColorStyles.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    '20/09/2021',
                    style: TextStyle(
                      color: ColorStyles.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(90, 15, 0, 30),
                decoration: BoxDecoration(
                  color: ColorStyles.lightBlue,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thành viên',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ColorStyles.darkBlue,
                            ),
                          ),
                          IconButton(
                            onPressed: addMember,
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
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: Stack(
                              alignment: Alignment(0.8, 0),
                              children: [
                                UserListTile(
                                  imageURL: members[index]['imageURL'],
                                  name: members[index]['name'],
                                  detail: members[index]['detail'],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      members.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    size: 25,
                                    color: ColorStyles.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: members.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: OutlinedButton(
                onPressed: () {
                  print(1);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFF0EA52F),
                ),
                child: Text(
                  'Hoàn thành',
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

  void beginEdittingDescription() {
    setState(() {
      descriptionTextFieldReadOnly = false;
    });
    descriptionTextFieldFocusNode.requestFocus();
  }

  void endEdittingDescription() {
    setState(() {
      descriptionTextFieldReadOnly = true;
    });
    descriptionTextFieldFocusNode.requestFocus();
  }

  void addMember() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MemberManagementScreen(),
      ),
    );
  }
}

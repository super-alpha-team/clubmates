import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/activity_list_tile.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/components/group_activity_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupManagementScreen extends StatefulWidget {
  const GroupManagementScreen({Key key}) : super(key: key);

  @override
  State createState() => _GroupManagementState();
}

class _GroupManagementState extends State<GroupManagementScreen> {
  var data = List.generate(
    4,
    (index) => {
      'imageURL': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Ban truyền thông $index',
      'description':
          'Ban truyền thông có chức năng là xây dựng, lên ý tưởng, thiết kế các ấn phẩm truyền thông cho Câu lạc bộ.',
    },
  );

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
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                  onPressed: () {},
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
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: GestureDetector(
                    onLongPress: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) =>
                            groupManagementActionSheet(data[index]),
                      );
                    },
                    child: ClubListTile(
                      imageURL: data[index]['imageURL'],
                      name: data[index]['name'],
                      description: data[index]['description'],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CupertinoActionSheet groupManagementActionSheet(group) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(group['name']),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            
          },
          child: Text(
            'Sửa',
            style: TextStyle(
              color: ColorStyles.orange,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              data.remove(group);
            });
          },
          child: Text(
            'Xoá',
            style: TextStyle(
              color: ColorStyles.red,
            ),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Huỷ',
          style: TextStyle(
            color: ColorStyles.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

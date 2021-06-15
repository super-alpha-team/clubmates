import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/user_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberManagementScreen extends StatefulWidget {
  MemberManagementScreen({Key key}) : super(key: key);

  @override
  State createState() => _MemberManagementState();
}

class _MemberManagementState extends State<MemberManagementScreen> {
  var members = List.generate(
    4,
    (index) => {
      'imageURL': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Jasmine $index',
      'detail': 'Short Description',
    },
  );

  var pendingMembers = List.generate(
    4,
    (index) => {
      'imageURL': 'https://image.flaticon.com/icons/png/512/4857/4857076.png',
      'name': 'Jasmine ${index + 4}',
      'detail': 'Short Description',
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
        title: Text(
          'Design ITUS',
          style: TextStyle(
            color: ColorStyles.orange,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: ListView.builder(
          itemBuilder: buildItem,
          itemCount: members.length + pendingMembers.length + 2,
        ),
      ),
    );
  }

  Widget titleText(String text, {double marginTop = 0}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        text,
        style: TextStyle(
          color: ColorStyles.darkBlue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget memberListTile(member, CupertinoActionSheet actionSheet) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onLongPress: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => actionSheet,
          );
        },
        child: UserListTile(
          imageURL: member['imageURL'],
          name: member['name'],
          detail: member['detail'],
        ),
      ),
    );
  }

  Widget buildItem(context, index) {
    if (index == 0) {
      return titleText('Danh sách thành viên');
    }

    if (index <= members.length) {
      final member = members[index - 1];
      return memberListTile(member, memberActionSheet(member));
    }
    if (index == members.length + 1) {
      return titleText('Danh sách chờ duyệt', marginTop: 30);
    }

    final member = pendingMembers[index - members.length - 2];
    return memberListTile(member, pendingMemberActionSheet(member));
  }

  void removeMember(member) {
    setState(() {
      members.remove(member);
    });
  }

  void addMember(member) {
    setState(() {
      pendingMembers.remove(member);
      members.add(member);
    });
  }

  CupertinoActionSheet memberActionSheet(member) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(member['name']),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            removeMember(member);
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

  CupertinoActionSheet pendingMemberActionSheet(member) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(member['name']),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            addMember(member);
          },
          child: Text(
            'Thêm',
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

import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/user_nav_bar.dart';
import 'package:flutter/material.dart';

class AddTargetScreen extends StatefulWidget {
  const AddTargetScreen({Key key}) : super(key: key);

  @override
  State createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
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
        actions: [
          UserNavBar(
            imageURL:
                'https://image.flaticon.com/icons/png/512/4857/4857076.png',
            name: 'Xuân Mai',
            role: 'Quản lý',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thêm công việc',
                style: TextStyle(
                  color: ColorStyles.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildTextField('Tên mục tiêu'),
              buildTextField('Mô tả'),
              buildTextField('Ngày hết hạn'),
              buildTextField('Chọn người thực hiện'),
              buildTextField('Ghi chú'),

              Expanded(
                child: Container(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ColorStyles.lightPurple,
                  ),
                  child: Text(
                    'Thêm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.darkBlue,
                    ),
                  ),
                ),
            ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTextField(String hintText) {
    return Container(
      height: 70,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.black.withAlpha(100),
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorStyles.black,
            fontSize: 20,
          ),
        ),
        style: TextStyle(
          color: ColorStyles.black,
          fontSize: 20,
        ),
      ),
    );
  }
}

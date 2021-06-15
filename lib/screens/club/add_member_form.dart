import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';

class AddMemberForm extends StatelessWidget {
  // const CreateClubForm({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _role;

  Widget _buildName() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Nhập tên thành viên',
          // border: InputBorder.none,
          fillColor: ColorStyles.white,
        ),
        // style: TextStyle(color: ColorStyles.darkOrange),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Bạn chưa điền tên';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildRole() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Nhập vai trò',
            // border: InputBorder.none,
            fillColor: ColorStyles.white,
          ),
          // style: TextStyle(color: ColorStyles.darkOrange),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Bạn phải nhập mô tả';
            }

            return null;
          },
          onSaved: (String value) {
            _role = value;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
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
            children: [
              Text(
                'THÊM THÀNH VIÊN',
                style: TextStyle(
                  color: ColorStyles.darkOrange,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildRole(),
                    SizedBox(height: 100),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_name);
                          print(_role);
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
                              MaterialStateProperty.all(ColorStyles.darkOrange),
                        ),
                        child: Text(
                          'Thêm thành viên',
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorStyles.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

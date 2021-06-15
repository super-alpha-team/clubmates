import 'package:flutter/material.dart';
import 'package:clubmate/color_styles.dart';

class CreateClubForm extends StatelessWidget {
  // const CreateClubForm({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _description;
  String _type;

  Widget _buildName() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Nhập tên Câu lạc bộ',
          // border: InputBorder.none,
          fillColor: ColorStyles.white,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(15),
          //   borderSide: BorderSide(color: ColorStyles.darkOrange),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(15),
          //   borderSide: BorderSide(color: ColorStyles.darkOrange),
          // ),
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

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Nhập mô tả',
            // border: InputBorder.none,
            fillColor: ColorStyles.white,
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: ColorStyles.darkOrange),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: ColorStyles.darkOrange),
            // ),
          ),
          // style: TextStyle(color: ColorStyles.darkOrange),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Bạn phải nhập mô tả';
            }

            return null;
          },
          onSaved: (String value) {
            _description = value;
          },
        ),
      ),
    );
  }

  Widget _buildClubType() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Chọn loại Câu lạc bộ',
          // border: InputBorder.none,
          fillColor: ColorStyles.white,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(15),
          //   borderSide: BorderSide(color: ColorStyles.darkOrange),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(15),
          //   borderSide: BorderSide(color: ColorStyles.darkOrange),
          // ),
        ),
        // style: TextStyle(color: ColorStyles.darkOrange),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Bạn phải chọn loại CLB';
          }

          return null;
        },
        onSaved: (String value) {
          _type = value;
        },
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
                'TẠO CÂU LẠC BỘ',
                style: TextStyle(
                  color: ColorStyles.darkOrange,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'A Moments of Entertainment',
                style: TextStyle(
                  color: ColorStyles.darkOrange,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildDescription(),
                    _buildClubType(),
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
                          print(_description);
                          print(_type);
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
                          'Tạo câu lạc bộ',
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

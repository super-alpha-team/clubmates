import 'dart:convert';

import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/color_styles.dart';
import 'package:clubmate/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersionalDetail extends StatefulWidget {
  PersionalDetail({Key key, @required this.user}) : super(key: key);
  final UserClass user;
  @override
  State<StatefulWidget> createState() => _PersionalDetailState();
}

class _PersionalDetailState extends State<PersionalDetail> {
  UserClass _user = null;
  bool _isEnableDes = false;
  bool _isEnableName = false;
  bool _isEnablePhone = false;
  bool _isEnableEmail = false;
  Icon editDes = Icon(Icons.edit),
      editName = Icon(Icons.edit),
      editEmail = Icon(Icons.edit),
      editPhone = Icon(Icons.edit);
  TextEditingController _ctrl_des, _ctrl_phone;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // _ctrl_des = TextEditingController(text: widget.user.description);
    _ctrl_phone = TextEditingController(text: widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    _user = widget.user;

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                // InkWell(
                //   onTap: () {},
                //   child: Text("aaa"),
                // ),
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_user.photo),
                    radius: 80,
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  indent: 60,
                  endIndent: 60,
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(right: 60, left: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,

                    children: [
                      Container(
                        child: Text(
                          "Tên",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: editName,
                          onPressed: () {
                            setState(() {
                              _isEnableName = !_isEnableName;
                              editName = _isEnableName
                                  ? Icon(Icons.save)
                                  : Icon(Icons.edit);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: _user.name,
                    enabled: _isEnableName,
                    onSaved: (value) => _user.name = value,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.darkBlue),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  indent: 60,
                  endIndent: 60,
                  height: 30,
                ),
                // Container(
                //   // margin: EdgeInsets.only(top: 5, bottom: 5),

                //   padding: EdgeInsets.only(right: 60, left: 60),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment
                //         .spaceBetween, //Center Row contents horizontally,
                //     crossAxisAlignment: CrossAxisAlignment
                //         .center, //Center Row contents vertically,
                //     children: [
                //       Container(
                //         child: Text(
                //           "Giới thiệu",
                //           style: TextStyle(
                //               fontSize: 22,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.black54),
                //         ),
                //       ),
                //       Container(
                //         child: IconButton(
                //           icon: editDes,
                //           onPressed: () {
                //             setState(() {
                //               _isEnableDes = !_isEnableDes;
                //               editDes = _isEnableDes
                //                   ? Icon(Icons.save)
                //                   : Icon(Icons.edit);
                //             });
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   // margin: EdgeInsets.only(top: 5, bottom: 5),
                //   width: 250,
                //   child: TextFormField(
                //     controller: _ctrl_des,
                //     // decoration: InputDecoration(
                //     //   border: InputBorder.none,
                //     // ),
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.normal,
                //         color: ColorStyles.darkBlue),
                //     enabled: _isEnableDes,
                //     maxLines: 3,
                //     minLines: 1,
                //     onSaved: (value) => _user.description = value,
                //   ),
                //   // child: Text(
                //   //   "user?.description",
                //   //   style: TextStyle(
                //   //       fontSize: 20,
                //   //       fontWeight: FontWeight.normal,
                //   //       color: ColorStyles.darkBlue),
                //   // ),
                // ),
                // Divider(
                //   color: Colors.black,
                //   indent: 60,
                //   endIndent: 60,
                //   height: 30,
                // ),
                Container(
                  // margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.only(right: 60, left: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Container(
                          child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      )),
                      // Container(
                      //   child: IconButton(
                      //     icon: editEmail,
                      //     onPressed: () {
                      //       setState(() {
                      //         _isEnableEmail = !_isEnableEmail;
                      //         editEmail = _isEnableEmail
                      //             ? Icon(Icons.save)
                      //             : Icon(Icons.edit);
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  // margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: _user.email,
                    enabled: _isEnableEmail,
                    onSaved: (value) => _user.email = value,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.darkBlue),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
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
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Container(
                          child: Text(
                        "Số điện thoại",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      )),
                      Container(
                        child: IconButton(
                          icon: editPhone,
                          onPressed: () {
                            setState(() {
                              _isEnablePhone = !_isEnablePhone;
                              editPhone = _isEnablePhone
                                  ? Icon(Icons.save)
                                  : Icon(Icons.edit);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _ctrl_phone,
                    // decoration: InputDecoration(
                    //   border: InputBorder.none,
                    // ),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.darkBlue),
                    enabled: _isEnablePhone,
                    onSaved: (value) => _user.phone = value,
                  ),
                  // child: Text(
                  //   user.phone?"dsd":"dsds",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.normal,
                  //       color: ColorStyles.darkBlue),
                  // ),
                ),
                Divider(
                  color: Colors.transparent,
                  indent: 60,
                  endIndent: 60,
                  height: 30,
                ),
                Container(
                  // margin: EdgeInsets.only(top: 5, bottom: 5),

                  alignment: FractionalOffset.bottomCenter,
                  child: OutlinedButton(
                    // style: ButtonStyle(
                    //   fixedSize: MaterialStateProperty.all(Size(250, 40)),
                    //   foregroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.blue),
                    // ),
                    onPressed: () async {
                      _formKey.currentState.save();
                      String jsonData = '{"name":"' +
                          _user.name +
                          // '","description":"' +
                          // _user.description +
                          '","phone":"' +
                          _user.phone +
                          '","studentId":"' +
                          _user.userId +
                          '","photo":"' +
                          _user.photo +
                          '"}';
                      // print(json_data);
                      final result = await UserAPI.instance.update(jsonData);
                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Updated',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorStyles.white))));
                      }
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
        ),
      ),
    );
  }
}

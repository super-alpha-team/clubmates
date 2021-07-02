import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/color_styles.dart';
import 'package:clubmate/models/club_with_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubDetail extends StatefulWidget {
  ClubDetail({
    Key key,
    @required this.club,
  }) : super(key: key);

  final ClubRole club;

  @override
  State<ClubDetail> createState() => _ClubDetailState();
}

class _ClubDetailState extends State<ClubDetail> {
  ClubRole _club;
  bool _isEnableName = false;
  bool _isEnableDes = false;
  String clubType;
  Icon editName, editDes;

  @override
  void initState() {
    super.initState();
    _club = widget.club;
    clubType = _club.category;
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.black),
            onPressed: () async {
              String jsonData = '{"name":"' +
                  _club.name +
                  // '","description":"' +
                  // _user.description +
                  '","category":"' +
                  clubType +
                  '","description":"' +
                  _club.description +
                  '","photo":"' +
                  _club.photo +
                  '"}';
              final result = await ClubAPI.instance.update(_club.id, jsonData);
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Updated',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorStyles.white))));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Update Failed',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorStyles.white))));
              }
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // InkWell(
              //   onTap: () {},
              //   child: Text("aaa"),
              // ),
              Container(
                child: CircleAvatar(
                  // backgroundColor: ColorStyles.lightPurple,
                  backgroundImage: NetworkImage(_club.photo),
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
                padding: EdgeInsets.only(right: 60, left: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,

                  children: [
                    Container(
                      child: Text(
                        "Tên câu lạc bộ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: editName ?? Icon(Icons.edit),
                        onPressed: () {
                          setState(
                            () {
                              _isEnableName = !_isEnableName;
                              editName = _isEnableName
                                  ? Icon(Icons.save)
                                  : Icon(Icons.edit);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // child:
                // Text(
                //   _club.name,
                //   style: TextStyle(
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold,
                //       color: ColorStyles.darkBlue),
                // ),
                width: 250,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: _club.name,
                  enabled: _isEnableName,
                  onSaved: (value) => _club.name = value,
                  minLines: 1,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.darkBlue),
                ),
              ),
              Divider(
                color: Colors.black,
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
                      "Thể loại",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    )),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(right: 60, left: 60),
                  alignment: FractionalOffset.centerLeft,
                  child: DropdownButton<String>(
                    value: clubType,
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    iconSize: 40,
                    elevation: 16,
                    style:
                        const TextStyle(color: ColorStyles.black, fontSize: 20),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        clubType = newValue;
                      });
                    },
                    items: <String>[
                      'Học thuật',
                      'Tình nguyện',
                      'Chính trị',
                      'Âm nhạc'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
              Divider(
                color: Colors.black,
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
                        "Giới thiệu",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: editDes ?? Icon(Icons.edit),
                        onPressed: () {
                          setState(
                            () {
                              _isEnableDes = !_isEnableDes;
                              editDes = _isEnableDes
                                  ? Icon(Icons.save)
                                  : Icon(Icons.edit);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 5, bottom: 5),
                width: 300,
                // child: Text(
                //   _club.description,
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.normal,
                //       color: ColorStyles.darkBlue),
                // ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: _club.description,
                  enabled: _isEnableDes,
                  onSaved: (value) => _club.description = value,
                  minLines: 1,
                  maxLines: 10,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: ColorStyles.darkBlue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

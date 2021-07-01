import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/screens/models/user_model.dart';
import 'package:clubmate/screens/personal/personal_detail.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  UserClass _user;
  @override
  void initState() {
    super.initState();
    _getMe();
  }

  Future<Null> _getMe() async {
    final json = await UserAPI.instance.me();
    setState(() {
      _user = UserClass.fromJson(json['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': ,
        // '/profile': (context) => PersionalDetail(user: _user),
        '/': (context) => PersionalDetail(user: _user),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

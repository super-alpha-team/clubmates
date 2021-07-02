import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/models/club_member.dart';
import 'package:clubmate/models/club_with_role.dart';
import 'package:clubmate/models/user_model.dart';
import 'package:clubmate/screens/personal/club_edit.dart';
import 'package:clubmate/screens/personal/personal_detail.dart';
import 'package:clubmate/screens/personal/personal_summary_screen.dart';
import 'package:clubmate/screens/personal/user_task_list_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  UserClass _user;
  List<ClubMember> _clubs = [];
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
        '/': (context) => PersonalSummaryScreen(user: _user),
        '/profile': (context) => PersionalDetail(user: _user),
        '/task': (context) => UserTaskListScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

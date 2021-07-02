import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/apis/user_api.dart';
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
  List<ClubRole> _clubs = [];
  @override
  void initState() {
    super.initState();
    _getMe();
    _getClubs();
  }

  void _getClubs() async {
    final json = await ClubAPI.instance.meRaw();
    // club÷ = ClubRole.fromJson(json);
    // print(clubs);

    final data = json['data'];
    final n = data['total'];

    for (var i = 0; i < n; i++) {
      final club = ClubRole.fromJson(data['result'][i]);
      if (club.role == "manager")
        // print(club.photo);
        _clubs.add(club);
      // print(clubs.length);
    }
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
        '/': (context) => PersonalSummaryScreen(user: _user, clubs: _clubs),
        '/profile': (context) => PersionalDetail(user: _user),
        '/task': (context) => UserTaskListScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

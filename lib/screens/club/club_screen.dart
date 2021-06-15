import 'package:clubmate/color_styles.dart';
import 'package:clubmate/screens/club/club_group_management_screen.dart';
import 'package:clubmate/screens/club/club_member_screen.dart';
import 'package:clubmate/screens/club/club_report_screen.dart';
import 'package:clubmate/screens/club/group_member_screen.dart';
import 'package:clubmate/screens/club/group_slash_screen.dart';
import 'package:flutter/material.dart';
import 'club_management_screen.dart';
import 'club_slash_screen.dart';

class ClubScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // backgroundColor: ColorStyles.background,
        scaffoldBackgroundColor: ColorStyles.background,
        textTheme: TextTheme(
            headline1: TextStyle(
                color: ColorStyles.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                color: ColorStyles.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            headline3: TextStyle(
                color: ColorStyles.lightOrange,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(color: ColorStyles.black, fontSize: 16),
            subtitle1: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            subtitle2: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: ColorStyles.lightPurple,
            primary: ColorStyles.darkBlue,
            elevation: 0,
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            textStyle: TextStyle(
              color: ColorStyles.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ClubManagementScreen(),

        '/club': (context) => ClubSlashScreen(),
        // '/view': (context) => ClubViewScreen(),
        // '/update': (context) => ClubUpdateScreen(),
        '/member': (context) => ClubMemberManamentScreen(),
        '/report': (context) => ClubReportScreen(),
        '/group': (context) => ClubGroupManagementScreen(),
        '/group/home': (context) => GroupSlashScreen(),
        '/group/activity': (context) => GroupSlashScreen(),
        '/group/member': (context) => GroupMemberManamentScreen(),
      },
      // home: ClubManamentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

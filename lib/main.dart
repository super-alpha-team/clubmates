import 'package:clubmate/color_styles.dart';
import 'package:clubmate/screens/activity/activity_screen.dart';
import 'package:clubmate/screens/home/home_screen.dart';
import 'package:clubmate/screens/login/user_login.dart';
import 'package:clubmate/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clubmate/screens/club/create_club_screen.dart';
import 'package:clubmate/screens/club/create_club_form.dart';
import 'package:clubmate/screens/club/add_member_form.dart';
import 'package:clubmate/screens/club/add_activity_form.dart';

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // backgroundColor: ColorStyles.background,
          scaffoldBackgroundColor: ColorStyles.background,
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
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      // home: MainScreen(),
      home: Scaffold(
        body: AuthTypeSelector(),
      ),
      // home: ActivityScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

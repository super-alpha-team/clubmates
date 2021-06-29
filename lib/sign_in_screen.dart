import 'package:clubmate/apis/api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text('Sign In'),
            onPressed: _onSignInButtonClick,
          ),
          OutlinedButton(
            child: Text('Get me'),
            onPressed: _onGetMeButtonClick,
          ),
        ],
      ),
    ));
  }

  final user = {
    'name': 'user_admin',
    'userId': '12345678',
    'email': 'phamvmnhut@gmail.com'
  };

  void _onSignInButtonClick() async {
    // await _googleSignIn.signOut();
    // _handleSignIn();
    final res = await UserAPI.instance.signIn(user);
    print(res);
  }

  void _onGetMeButtonClick() async{
    final res = await UserAPI.instance.me();
    print(res);
  }

  // void _onSignInButtonClick() async {
  //   await _googleSignIn.signOut();
  //   _handleSignIn();
  // }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await user.authentication;
      print(googleSignInAuthentication.accessToken);
    } catch (error) {
      print(error);
    }
  }
}

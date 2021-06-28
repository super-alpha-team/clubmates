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
          child: OutlinedButton(
        child: Text('Sign In'),
        onPressed: _onSignInButtonClick,
      )),
    );
  }

  void _onSignInButtonClick() async{
    await _googleSignIn.signOut();
    _handleSignIn();
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await user.authentication;
      print(googleSignInAuthentication.accessToken);
    } catch (error) {
      print(error);
    }
  }
}

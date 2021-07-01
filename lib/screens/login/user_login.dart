import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
    //

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: SignInButton(Buttons.Google,
                  text: "Sign up with Google", onPressed: _handleSignIn),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signOut();
      // final user = await _googleSignIn.signIn();

      // final authentication = await user.authentication;
      // print(authentication.accessToken);
      // print(user.accessToken);
      GoogleSignInAccount ggAccount = await _googleSignIn.signIn();
      final user = {
        'name': ggAccount.displayName,
        'userId': ggAccount.id,
        'email': ggAccount.email,
        'photo': ggAccount.photoUrl
      };

      final signInResult = await UserAPI.instance.signIn(user);
      print(signInResult);
      if ('success' == signInResult['status']) {
        navigateToHome(context);
      }
    } catch (error) {
      print(error);
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  // void _pushPage(BuildContext context, Widget page) {
  //   Navigator.of(context) /*!*/ .push(
  //     MaterialPageRoute<void>(builder: (_) => page),
  //   );
  // }

}

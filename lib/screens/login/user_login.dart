import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthTypeSelector extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signOut();
      final user = await _googleSignIn.signIn();

      final authentication = await user.authentication;
      print(authentication.accessToken);
      // print(user.accessToken);
    } catch (error) {
      print(error);
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

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
}

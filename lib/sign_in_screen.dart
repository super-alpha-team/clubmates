import 'package:clubmate/apis/api.dart';
import 'package:clubmate/apis/user_api.dart';
import 'package:clubmate/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIn();
  }

  void checkSignIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool loggedIn = sharedPreferences.getBool('loggedIn') ?? false;
    if (loggedIn) {
      final userId = sharedPreferences.getString('user.userId');
      final user = {'userId': userId};
      final signInResult = await UserAPI.instance.signIn(user);
      if ('success' == signInResult['status']) {
        navigateToHome();
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : OutlinedButton(
                child: Text('Đăng nhập bằng Google'),
                onPressed: _onSignInButtonClick,
              ),
      ),
    );
  }

  void _onSignInButtonClick() async {
    // await _googleSignIn.signOut();
    _handleSignIn();
    // final res = await UserAPI.instance.signIn(user);
    // print(res);
  }

  Future<void> _handleSignIn() async {
    try {
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
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("user.userId", user['userId']);
        sharedPreferences.setBool("loggedIn", true);
        navigateToHome();
      }
    } catch (error) {
      print(error);
    }
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }
}

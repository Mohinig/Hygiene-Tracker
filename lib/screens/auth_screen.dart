import 'package:flutter/material.dart';
import 'package:hygienetracker/services/auth.dart';
import 'package:hygienetracker/widgets/sign_in_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({@required this.auth});
  final Auth auth;

  @override
  Widget build(BuildContext context) {
    const spaceBox = const SizedBox(
      height: 10.0,
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Hygiene Tracker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
            ),
            spaceBox,
            spaceBox,
            SignInButton(
              icon: Image.asset('assets/images/google-logo.png'),
              signInText: 'Sign in with Google',
              onPressed: _signInWithGoogle,
              color: Colors.white,
              textColor: Colors.black,
            ),
            spaceBox,
            SignInButton(
              icon: Image.asset('assets/images/facebook-logo.png'),
              signInText: 'Sign in with Facebook',
              onPressed: _signInWithFb,
              color: Colors.blue[900],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print('message=$e');
    }
  }

  Future<void> _signInWithFb() async {
    try {
      await auth.signInWithFb();
    } catch (e) {
      print('message=$e');
    }
  }
}

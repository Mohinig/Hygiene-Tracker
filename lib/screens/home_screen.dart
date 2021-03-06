import 'package:flutter/material.dart';
import 'package:hygienetracker/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.auth});
 final Auth auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        child: Center(child: Text('Hello World',
        style: TextStyle(
          fontSize: 40.0
        ),)),
      ),
    );
  }
}

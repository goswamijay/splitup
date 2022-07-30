import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../sparce/sparse_first.dart';

class Logout extends StatefulWidget {
  static String id = 'logout';
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => first(),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                logout();
                //   getMessages();
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

}
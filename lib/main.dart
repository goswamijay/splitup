import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spilt_money_with_friend/information_of_group.dart';
import 'package:spilt_money_with_friend/sparce/sparse.dart';
import 'package:spilt_money_with_friend/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Authenticate/logout.dart';
import 'billspilthomepage.dart';
import 'dart:ui';

import 'sparce/sparse_first.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(
      MyApp());
}


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;

  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }



  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? first.id : homepage.id ,
      ///key value pair
      routes: {
        homepage.id: (context) => homepage(),
        information_of_group.id : (context) => information_of_group(),
        first.id: (context) => first(),
        Logout.id : (context) => Logout(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: first(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;


  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);


    print("Account created Succesfull");
    await _firestore.collection('users').doc(_auth.currentUser?.uid).set({
      "Name": name,
      "Email": email,
      "uid": _auth.currentUser!.uid,
    });
    return userCrendetial.user;
  } catch (e) {
    print("Error");
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;


  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);


    print("Login Sucessfull");
    return userCredential.user;
  } catch (e) {
    print("Error");
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}

class EmailValidator{
  static String? validate(String value){
    if(value.isEmpty)
      {
        return "Email can't be empty";
      }
    return null;
  }

}

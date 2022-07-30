import 'package:flutter/material.dart';
import 'package:spilt_money_with_friend/sparce/sparse_fourth.dart';
import 'package:spilt_money_with_friend/sparce/sparse_third.dart';

import '../Authenticate/login_screen.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 350,
                width: 500,
                child: Image.asset('assets/onboarding_1.png')),
            Container(
                margin: EdgeInsets.only(top: 10.0, left: 0),
                child: Text(
                  "Free your Wallet \nof receipts",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 44.0,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            Container(
              padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(top: 20.0, left: 0),
                child: Text(
                  "All expenses are \n backed up and \nevery member can see \nthem.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    fontStyle: FontStyle.normal,
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                child: Text(
                  "SKIP",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  LoginScreen()),
    );}),

            IconButton(icon: Icon(Icons.navigate_next_outlined,color: Colors.orange,), onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const third()),
            );}),
          ],

        ),
      ),
    );
  }
}

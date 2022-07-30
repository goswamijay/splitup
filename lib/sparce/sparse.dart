import 'package:flutter/material.dart';

class sparcescreen extends StatefulWidget {
  const sparcescreen({Key? key}) : super(key: key);

  @override
  State<sparcescreen> createState() => _sparcescreenState();
}

class _sparcescreenState extends State<sparcescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
        child: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: "Jan 15,",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "\nHello, Jay",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}

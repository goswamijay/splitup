import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spilt_money_with_friend/sparce/sparse_fourth.dart';
import 'package:spilt_money_with_friend/sparce/sparse_second.dart';

import '../Authenticate/login_screen.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);
  static String id = 'Sparse';

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

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
                margin: EdgeInsets.only(top: 8.0, left: 0),
                child: Text(
                  "Sharing \nExpenses \nwith Friends",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 15.0, left: 0),
                child: Text(
                  "Split Up keeps track of \nyour gang’s \n expenses – great for \ntravellers, flatmates, \ncouples and others.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
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
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );}),
            IconButton(
                icon: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const second()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

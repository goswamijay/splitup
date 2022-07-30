import 'package:flutter/material.dart';
import 'package:spilt_money_with_friend/Authenticate/login_screen.dart';
import 'package:spilt_money_with_friend/FrontPage.dart';
import 'package:spilt_money_with_friend/sparce/sparse_fourth.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 320,
                width: 500,
                child: Image.asset('assets/onboarding_2.png')),
            Container(
                margin: EdgeInsets.only(top: 10.0, left: 0),
                child: Text(
                  "Good accounting \nmakes \ngood friends",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 16.0, left: 0),
                child: Text(
                  "No more disputes over the \nbill. Settle Up shows \nwho pays next and minimizes \nthe transactions.",
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
     MaterialPageRoute(builder: (context) => LoginScreen()),
     );}),

            IconButton(icon: Icon(Icons.navigate_next_outlined,color: Colors.orange,),  onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FrontPage()),);}),

            TextButton(
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),);}),
          ],



        ),
      ),
    );
  }
}

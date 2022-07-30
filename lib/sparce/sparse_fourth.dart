import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spilt_money_with_friend/create_team_home.dart';
import 'package:spilt_money_with_friend/homepage.dart';

class fourth extends StatefulWidget {
  const fourth({Key? key}) : super(key: key);

  @override
  State<fourth> createState() => _fourthState();
}

class _fourthState extends State<fourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar
        (
        title: new Row
          (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Container(child: Text('Split UP')),
            IconButton(
              icon: Icon(
                Icons.navigate_next_outlined,
                color: Colors.white,
              ),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const create_team_home()),);
                // do something
              },
            )
          ],
        )
      ),
        body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 7.0, left: 0),
                height: 150,
                width: 175,
                child: Image.asset('assets/onboarding_2.png')),
            Container(
                margin: EdgeInsets.only(top: 7.0, left: 0),
                child: Text(
                  "Sign in to allow for backup \nand synchronization \nof your groups.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    fontStyle: FontStyle.normal,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 0),

              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                icon: Image.asset('assets/google.png'),
                label: Text(
                  'Sign in With Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10.0, left: 0),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blue)),
                onPressed: () {},
                icon: Image.asset('assets/facebook.png'),
                label: Text(
                  'Sign in With FaceBook',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 0),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.black)),
                onPressed: () {},
                icon: Image.asset('assets/apple.png'),
                label: Text(
                  'Sign in With Apple',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 0),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.red)),
                onPressed: () {},
                icon: Icon(Icons.email,color: Colors.white,),
                label: Text(
                  'Sign in With Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0, left: 0),
                child: Text(
                  "By continuing, you are \n indicating that you accept our \n Terms of Service and Privacy Policy."
                      ,
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
    );
  }
}

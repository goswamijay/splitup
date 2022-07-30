import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spilt_money_with_friend/information_of_group.dart';

import '../FrontPage.dart';


class add_new_team extends StatefulWidget {
  const add_new_team({Key? key}) : super(key: key);

  @override
  State<add_new_team> createState() => _add_new_teamState();
}

class _add_new_teamState extends State<add_new_team> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body:Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15,left: 2),
              alignment: Alignment.centerLeft,
              color: Color.fromRGBO(229, 0, 99, 1.0),
              width: size.width / 0.5,
              child: IconButton(
                  icon: Icon(Icons.close,color: Colors.white,size: 29,), onPressed: () {}),
            ),
            Container(
              height: 120,
              width: double.infinity,
              color: Color.fromRGBO(229, 0, 99, 1.0),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child:
                  TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                        fontSize: 20
                      ),
                      labelText: 'Group Name',
                    ),
                  ),
              ),
            ),


          ],
        ),
      ),

      backgroundColor: Colors.white70,
      bottomNavigationBar: Material(
        color: Colors.white38,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FrontPage()),
            );
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'CREATE GROUP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

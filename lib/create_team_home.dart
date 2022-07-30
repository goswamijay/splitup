import 'package:flutter/material.dart';

import 'drawer.dart';

class create_team_home extends StatefulWidget {
  const create_team_home({Key? key}) : super(key: key);

  @override
  State<create_team_home> createState() => _create_team_homeState();
}

class _create_team_homeState extends State<create_team_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 224, 224, 1.0),
      drawer:drawer(),
      body: Container(

        child: Column(
          children: [
          Container(
              color: Colors.orange,
            width: double.infinity,
            height: 150,
            ),
            Container(
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,20,10,10),
                child: Card(
                 child: Text("Split UP is all about groups.If you got an invite link from a friend,click it to join the group",
                 style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,fontFamily: 'Arial',color: Colors.black),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

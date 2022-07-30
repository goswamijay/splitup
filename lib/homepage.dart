import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spilt_money_with_friend/about.dart';
import 'package:spilt_money_with_friend/sparce/sparse_first.dart';

import 'Authenticate/logout.dart';
import 'FrontPage.dart';
import 'Group Craete/add_team_member.dart';
import 'Tips.dart';
import 'information_of_group.dart';



class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);
  static String id = 'Homepage';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> membersList = [];

  @override
  void initState() {
    super.initState();
    getCurrentUserDetails();
  }


  void getCurrentUserDetails() async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      setState(() {
        String? name = _auth.currentUser!.displayName;
        membersList.add({
          "Name": map['Name'],
          "Email": map['Email'],
          "uid": map['uid'],
          "isAdmin": true,
          "Split" : 2,
          "Purpose" : "Purpose",
        });
      });
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => first(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){logout();},     icon: Icon(Icons.logout),
            )
          ],
        ),
        drawer: Container(
          width: 280,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                    accountName: Text("User Name"),
                  accountEmail: Text("Email Id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://img.icons8.com/pastel-glyph/2x/user-male.png'),
                    backgroundColor: Colors.white,),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),

                ),

                ListTile(
                  title: const Text(
                    'My Groups',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.add),
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const information_of_group()),
                  );},
                ),
                ListTile(
                  title: const Text(
                    'Create a new group',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.add_circle_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddMembersInGroup()),
                    );
                  },
                ),

                Divider( thickness: 2),
                ListTile(
                  title: const Text(
                    'Tips',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.tips_and_updates_outlined),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TipScreen()),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Setting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.settings),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.info),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const aboutus()),
                    );
                  },
                ),
                Divider( thickness: 2),
                ListTile(
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.logout),
                  onTap: () { return logout();
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Logout()),
                    );*/
                  },
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,20,10,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                SizedBox(
                  width: 400.0,
                  height: 100.0,
              child:  ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddMembersInGroup()),
                    );
                  },
                  label: Text(
                    "Create New Teams",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 3, 133, 194),
                    fixedSize: const Size(208, 43),
                  ),
                ),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: 400.0,
                height: 100.0,
                child:ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  information_of_group()),
                      );

                    },
                    label: Text(
                      "Existing Team",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 3, 133, 194),
                      fixedSize: const Size(208, 43),
                    ),
                  ),
              ),
            ),
              ],
            ),
          ),
        ),
      );
}

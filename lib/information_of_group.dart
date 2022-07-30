import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spilt_money_with_friend/SplitMoney.dart';
import 'package:spilt_money_with_friend/SplitMoneyNotifier.dart';

import 'Expense Details Screen.dart';
import 'Group Craete/add_existing_team_member.dart';
import 'Group Craete/add_team_member.dart';
import 'Group Craete/showMember1.dart';
import 'Group Expense Screen.dart';
import 'addMoney.dart';
import 'create_team_home.dart';
import 'homepage.dart';

class information_of_group extends StatefulWidget {
  const information_of_group({Key? key}) : super(key: key);
  static String id = 'information_of_group';

  @override
  Route createRoute (BuildContext context){
    return MaterialPageRoute(
       builder: (BuildContext context) { return information_of_group(); },

    );
  }
  State<information_of_group> createState() => _information_of_groupState();
}

class _information_of_groupState extends State<information_of_group> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: myform(),
      );
}

class myform extends StatefulWidget {
  const myform({Key? key}) : super(key: key);

  @override
  State<myform> createState() => _myformState();
}

class _myformState extends State<myform> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;
  var groupId = '';

  List groupList = [];
  List<dynamic> membersList0 = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
    getGroupDetails();  }

  void getGroupDetails() async {
    await _firestore.collection('groups').doc(groupId).get().then((chatMap) {
      membersList0 = chatMap['members'];
      print(membersList0);
      isLoading = false;

      setState(() {});
    });
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('groups')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(234, 30, 99, 1).withOpacity(1),
        elevation: 0.0,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*SizedBox(
                    height: 340,
                    width: 400,
                   */ /* child: Image.asset('assets/water_bubble.jpg',
                        fit: BoxFit.cover)*/ /*),*/
                Container(
                  color: Color.fromRGBO(234, 30, 99, 1),
                  width: 400,
                  child: SizedBox(
                    width: 340,
                    height: 380,
                    child: Column(
                      children: [
                        groupList.length >= 1
                            ? CustomPaint(
                                painter: OpenPainter(),
                              )
                            : SizedBox(),
                        groupList.length >= 2
                            ? CustomPaint(
                                painter: OpenPainter1(),
                              )
                            : SizedBox(),
                        groupList.length >= 3
                            ? CustomPaint(
                                painter: OpenPainter2(),
                              )
                            : SizedBox(),
                        groupList.length >= 4
                            ? CustomPaint(
                                painter: OpenPainter3(),
                              )
                            : SizedBox(),
                        groupList.length >= 5
                            ? CustomPaint(
                                painter: OpenPainter4(),
                              )
                            : SizedBox(),
                        groupList.length >= 6
                            ? CustomPaint(
                                painter: OpenPainter5(),
                              )
                            : SizedBox(),
                        groupList.length >= 7
                            ? CustomPaint(
                                painter: OpenPainter6(),
                              )
                            : SizedBox(),
                        groupList.length >= 8
                            ? CustomPaint(
                                painter: OpenPainter7(),
                              )
                            : SizedBox(),
                        groupList.length >= 9
                            ? CustomPaint(
                                painter: OpenPainter8(),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.pink,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:IconButton(
                          icon: Icon(Icons.add,size: 30.0,color: Colors.white),
                                onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddMembersInGroup()),
                          );
                          },
                            ),
                          ),

                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                            itemCount: groupList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  groupList[index]['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => groupExpenseDetails(
                                      groupName: groupList[index]['name'],
                                      groupId: groupList[index]['id'],
                                    ),
                                  ),
                                ),
/*
                          leading: Icon(Icons.group),
*/

                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Split Up is all about groups. If you got an invite link from a friends,click it to join the group.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const create_team_home()));
                              },
                              child: Text(
                                "JOIN A NEARBY GROUP",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.all(20),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                ),

                SizedBox(
                  height: size.height / 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: groupList.isEmpty
                      ? SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const add_new_team()),
                              );
                            },
                            label: Text(
                              "Create A New Teams",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              fixedSize: const Size(208, 43),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*class showMember1 extends StatefulWidget {
  final String groupId, groupName;

  const showMember1({required this.groupId, required this.groupName, Key? key})
      : super(key: key);

  @override
  State<showMember1> createState() => _showMember1State();
}

class _showMember1State extends State<showMember1> {
  List<dynamic> membersList0 = [];
  bool isLoading = true;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getGroupDetails();
  }

  void getGroupDetails() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .get()
        .then((chatMap) {
      membersList0 = chatMap['members'];
      print(membersList0);
      isLoading = false;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    List membersList = [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Group Members Name"),
        backgroundColor: Colors.pink,
        shadowColor: Colors.pink,
      ),
      backgroundColor: Colors.pink,
      body: SimpleDialog(
          title: const Text('Group Members Name',style: TextStyle(color: Colors.black),),
          children: <Widget>[
          Container(
      color: Colors.grey[200],
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: membersList0.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () =>
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              addMoney(groupName: widget.groupName,
                                  groupId: widget.groupId),
                        ),
                      ),
*//*
                          leading: Icon(Icons.group),
*//*
                  title: Text(
                    membersList0[index]['Name'],
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
        ), ),
        ],

            ),
    );

  }
}*/

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(-120, 300), 70, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter1 extends CustomPainter {
  List groupList = [];

  @override
  void paint(Canvas canvas, Size size) {
    TextSpan span = new TextSpan(
        style: new TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        text: ("Hello"));
    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 190), 70, paint1);
    tp.paint(canvas, new Offset(-20, 180));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(120, 80), 70, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(-120, 80), 70, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(120, 300), 70, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(120, 200), 60, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter6 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(-120, 200), 60, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter7 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 70), 60, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter8 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(239, 106, 151, 1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 305), 60, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

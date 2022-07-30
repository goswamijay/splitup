import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:spilt_money_with_friend/SplitMoneyNotifier.dart';

import 'package:spilt_money_with_friend/addMoney.dart';
import 'package:spilt_money_with_friend/information_of_group.dart';
import 'package:spilt_money_with_friend/splitMoneyShow.dart';
import 'package:uuid/uuid.dart';

import 'create_team_home.dart';
import 'homepage.dart';

class Expense_Details_Screen extends StatefulWidget {
  final answer;
  final String groupId, groupName;
  const Expense_Details_Screen(
      {required this.answer,
      required this.groupName,
      required this.groupId,
      Key? key})
      : super(key: key);
  @override
  State<Expense_Details_Screen> createState() => _Expense_Details_ScreenState();
}

class _Expense_Details_ScreenState extends State<Expense_Details_Screen> {
  final TextEditingController _purpose = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> membersList = [];
  List<dynamic> membersList0 = [];
  Map<String, dynamic>? userMap;
  List<String> tempArray = [];

  bool isLoading = true;
  String SplitId = Uuid().v1();

  @override
  void initState() {
    super.initState();
    getGroupDetails();
    getCurrentUserDetails();
  }

  void getGroupDetails() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .get()
        .then((chatMap) {
      membersList0 = chatMap['members'];
      print("memberlist0");
      print(membersList0);
      isLoading = false;
      setState(() {});
    });
  }

  void getCurrentUserDetails() async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      setState(() {
        membersList.add({
          "Name": map['Name'],
          "Email": map['Email'],
          "uid": map['uid'],
          "isAdmin": true,
        });
      });
    });
  }

  void UpdateMoney() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .collection('chats')
        .doc(SplitId)
        .update({
      "members": membersList0,
      "Who is Paid": _auth.currentUser!.email,
      "name": widget.groupName,
      "Total Money": widget.answer,
      "Purpose": _purpose,
      "Split Money": widget.answer / membersList0.length.toInt(),
    });
  }

  void onSendMessage() async {
    String SplitId = Uuid().v1();

    for (int i = 0; i <= membersList0.length; i++) {
      Map<String, dynamic> messages = {
        "SplitMoney": widget.answer / membersList0.length,
        "Purpose": _purpose.text,
        "TotalMoney": widget.answer,
        "WhoisPaid": _auth.currentUser!.email,
        "Purpose": _purpose.text,
        "SplitMoney": widget.answer / membersList0.length,

        "purpose": _purpose.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('groups')
          .doc(widget.groupId)
          .collection('chats')
          .doc(SplitId)
          .set({
        "members": membersList0,
        "WhoisPaid": _auth.currentUser!.email,
        "name": widget.groupName,
        "TotalMoney": widget.answer,
        "Purpose": _purpose.text,
        "SplitMoney": widget.answer / membersList0.length,
      });
    }
    ;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => SplitMoneyShow(
                  groupId: widget.groupId,
                  groupName: widget.groupId,
                  answer: widget.answer,
                  purpose: _purpose,
                )),
        (route) => true);

    /*  for (int i = 0; i <= membersList0.length; i++) {
      String uid =membersList0[i]['uid'];

      await _firestore
          .collection('users')
          .doc(uid)
          .collection('groups')
          .doc(groupId)
          .set({
        "name": widget.groupName,
        "id": groupId,
      });
    }

    await _firestore.collection('groups').doc(groupId).collection('chats').add({
      "message": "${_auth.currentUser!.displayName} Created This Group.",
      "type": "notify",
    });*/

    /*Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => information_of_group()), (route) => false);*/

    /* String groupId = Uuid().v1();

    await _firestore.collection('chats').doc(widget.groupId).set({

      "members": membersList0,
      "id": groupId,
    });

    for (int i = 0; i <=membersList0.length; i++) {
      String uid = membersList0[i]['uid'];

      await _firestore
          .collection('groups')
          .doc(uid)
          .collection('chats')
          .doc(groupId)
          .set({

        "Name": membersList0[i]["Name"],
        "Email": membersList0[i]['Email'],
        "uid": membersList0[i]['uid'],
        "isAdmin": false,
        "name": widget.groupName,
        "id": groupId,
        "Purpose": _purpose.text,
        "Date-Time": "Date-Time",
        "Division" : (widget.answer/membersList0.length.toInt()).toString(),

      });
    }
      await _firestore.collection('groups').doc(widget.groupId).collection('chats').add({
        "Purpose": _purpose.text,
        "Date-Time": "Date-Time",
        "Division" : (widget.answer/membersList0.length.toInt()).toString(),
      });*/
  }

  void onSplitMOney() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .collection('chats')
        .doc(widget.groupId)
        .get()
        .then((value) {
      setState(() {
        members:
        value.data();
      });
    });
  }

  Widget build(BuildContext context) {
    int? selectedAge;

    final Size size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.now();
    TimeOfDay time = TimeOfDay.now();
    var division = widget.answer / tempArray.length.toInt();

    return Scaffold(
        appBar: AppBar(
          title: Text("New Expense"),
          backgroundColor: Colors.pink,
          elevation: 0.0,

        ),
        body: SingleChildScrollView(
          child: Flex(
            //column and remove direction
            direction: Axis.vertical,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("Purpose"),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send), onPressed: onSendMessage),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: size.height / 14,
                          width: size.width / 1.1,
                          child: TextField(
                            controller: _purpose,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.menu),
                              hintText: "E.g. Movie with Friends",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("Who paid"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Flexible(
                          child: ListView.builder(
                            itemCount: membersList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => addMoney(
                                          groupId: widget.groupId,
                                          groupName: widget.groupName,
                                        )),
                                  );
                                },
                                leading: Icon(Icons.account_circle),
                                title: Text(membersList[index]['Name']),
                                subtitle: Text(membersList[index]['Email']),
                                trailing: Text(
                                  "₹" + widget.answer.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("For whom"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Flexible(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: membersList0.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    if (tempArray.contains(
                                        membersList0[index].toString())) {
                                      tempArray.remove(
                                          membersList0[index].toString());
                                    } else {
                                      (tempArray
                                          .add(membersList0[index].toString()));
                                    }
                                  });
                                },
                                leading: Icon(Icons.account_circle),
                                title: Text(
                                  membersList0[index]['Name'],
                                  style: TextStyle(
                                    fontSize: size.width / 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: tempArray.contains(
                                        membersList0[index].toString())
                                    ? Visibility(
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.red,
                                        ),
                                      )
                                    : SizedBox(),
                                subtitle: tempArray.contains(
                                        membersList0[index].toString())
                                    ? Text(
                                        "₹" + division.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text("₹0.0",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                              );
                            },
                          ),
                        ),
                      ),
                      new Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Text(
                              "SPLIT BY AMOUNTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      new Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "SPLIT BY SHARES",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("Date & Time"),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Flexible(
                                child: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day}, ${time.hour}:${time.minute}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.pink,
                              ),
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: dateTime,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                //if 'CANCEL' => null
                                if (newDate == null)
                                  return;
                                else //if 'CANCEL' => DateTime
                                  setState(() {
                                    dateTime = newDate;
                                  });
                                showTimePicker(
                                    context: context, initialTime: time);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.pink,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          onPressed:
                          onSendMessage;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "SAVE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spilt_money_with_friend/Group%20Craete/EditGroup.dart';
import 'package:spilt_money_with_friend/SplitMoneyNotifier.dart';
import 'package:spilt_money_with_friend/information_of_group.dart';
import 'package:spilt_money_with_friend/updateAddMOney.dart';
import 'package:spilt_money_with_friend/updateSplitMoneyScreen.dart';
import 'package:spilt_money_with_friend/Expense Details Screen.dart';
import 'package:uuid/uuid.dart';

import 'Group Craete/add_existing_team_member.dart';
import 'addMoney.dart';
import 'create_team_home.dart';
import 'homepage.dart';

class groupExpenseDetails extends StatefulWidget {
  final String groupId, groupName;

  const groupExpenseDetails(
      {required this.groupId, required this.groupName, Key? key})
      : super(key: key);

  @override
  State<groupExpenseDetails> createState() => _groupExpenseDetailsState();
}

class _groupExpenseDetailsState extends State<groupExpenseDetails> {
  final TextEditingController purpose = new TextEditingController();
  List groupList = [];
  List<Map<String, dynamic>> Splitmoney = [];

  bool isLoading = true;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<dynamic> membersList0 = [];
  List<dynamic> membersList1 = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GetIt serviceLocator = GetIt.instance;

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
  String SplitId = Uuid().v1();

  List<String> Purpose = [];
  List<String> WhoisPaid = [];
  List<double> SplitMoney = [];
  List<double> TotalMoney = [];
  List<String> name = [];
  late List members;
  int? length1;

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
    getGroupDetails();
    onSplitMOney();
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

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget nextPage = TextButton(
        child: Text("Next Page"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addMoney(
            groupId: widget.groupId,
            groupName: widget.groupName,
          ),));
        }
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => groupExpenseDetails(groupId: widget.groupId, groupName: widget.groupName,)));
      }
    );
    Widget continueButton = TextButton(
      child: Text("Settle UP Money"),
      onPressed: () {
        FirebaseFirestore.instance
            .collection('groups')
            .doc(widget.groupId)
            .collection('chats')
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            WhoisPaid.remove(doc['WhoisPaid']);
          });
        },
        );
      },
    );

  /*  // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SettleUp Money Split Details"),
      content: Text(
          "If you click on SettleUp Money button then Selltle Money and that Purpose Split Money is delete"),
      actions: [
        cancelButton,
        continueButton,
        nextPage,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );*/
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

  Future onSplitMOney() async {
    FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('chats')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        length1 = querySnapshot.size;

        WhoisPaid.add(doc['WhoisPaid']) ;
        TotalMoney.add(doc['TotalMoney']);
        name.add(doc['name']);
        members = doc['members'];
        SplitMoney.add( doc['SplitMoney']);
        Purpose.add(doc['Purpose']);

        print(WhoisPaid);
        print(TotalMoney);
        print(name);
        print(members);
        print(SplitMoney);
        print(Purpose);
        print(length1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
        "/updateSplitMoneyScreen": (BuildContext context) => new UpdateAddMoney1(groupName: widget.groupName, groupId: widget.groupId, SplitId: SplitId, purpose: purpose),
        },
        home:Scaffold(
      appBar: AppBar(
        title: Text("Group Members Name"),
        backgroundColor: Colors.pink,
        shadowColor: Colors.pink,
        elevation: 0.0,

      ),
      backgroundColor: Colors.pink,
      body: Column(
        children: [
          SimpleDialog(
            title: Text(
              widget.groupName + " Group",
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                height: 250.0, // Change as per your requirement
                width: 300.0, // Change as per your requirement
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: membersList0.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => addMoney(
                            groupId: widget.groupId,
                            groupName: widget.groupName,
                          ),
                        ),
                      ),
                      leading: Icon(Icons.group),
                      title: Text(
                        membersList0[index]['Name'],
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    /*  trailing: membersList0[index]['Email'] == WhoisPaid[index]  ?     Text("+" + (TotalMoney+SplitMoney).toString()):
                      Text("-" + (TotalMoney!+SplitMoney!).toString())*/
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: InkWell(
         onTap: () => navigatorKey.currentState?.pushNamed('/updateSplitMoneyScreen',),
                child: FutureBuilder(
                    future: onSplitMOney(),
                    initialData: [],
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount:  length1,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 170,
                            child:  Card(
                              semanticContainer: true,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("Recent Payment"),
                                      ),
                                    ),
                                    new Divider(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: (WhoisPaid[index]),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              TextSpan(
                                                text: " added an expanse ->",
                                              ),
                                              TextSpan(
                                                  text:
                                                      "₹" + (TotalMoney[index]).toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text: (" With "),
                                              ),
                                              TextSpan(
                                                  text: (members[1]["Name"])
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text: (" Purpose is : "),
                                              ),
                                              TextSpan(
                                                  text: (Purpose[index]).toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: (" Split Money is : "),),
                                          TextSpan(
                                              text: ( SplitMoney[index]).toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 10,
                              margin: EdgeInsets.all(10),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          );
                        },
                      );
                    }),
              ))
        ],
      ),
    ),
    );
  }
}



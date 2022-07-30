import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spilt_money_with_friend/Expense%20Details%20Screen.dart';
import 'package:spilt_money_with_friend/updateAddMOney.dart';
import 'package:spilt_money_with_friend/updateSplitMoneyScreen.dart';
import 'package:uuid/uuid.dart';

class SplitMoneyShow extends StatefulWidget {
  static String id = 'SplitMoneyShow';

  final groupId, groupName;
  final answer;
  final TextEditingController purpose;
  const SplitMoneyShow(
      {
      required this.groupId,
      required this.groupName,
      required this.answer,
      required this.purpose,
      Key? key})
      : super(key: key);

  @override
  State<SplitMoneyShow> createState() => _SplitMoneyShowState();
}

class _SplitMoneyShowState extends State<SplitMoneyShow> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  List<dynamic> membersList0 = [];
  String SplitId = Uuid().v1();
  GetIt serviceLocator = GetIt.instance;


  double? splitmoney;
  String? purpose;
  double? totalMoney;
  String? paid;
  List<String> Purpose = [];
  List<String> WhoisPaid = [];
  List<double> SplitMoney = [];
  List<double> TotalMoney = [];
  List<String> name = [];
  late List members;
  int? length1;

  void initState() {
    super.initState();
   // onSplitMOney();
   onSplitMOney1();
  }

/*  void onSplitMOney() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .collection('chats')
        .doc(widget.SplitId)
        .get()
        .then((value) {
      print("Hello");

      splitmoney = value['Split Money'];
      purpose = value['Purpose'];
      totalMoney = value['Total Money'];
      paid = value['Who is Paid'];

      print(splitmoney);
      print(purpose);
      print(totalMoney);
      print(paid);
    });
  }*/
  Future onSplitMOney1() async {
    String split = _auth.currentUser!.uid;

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
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          "/updateSplitMoneyScreen": (BuildContext context) => new UpdateAddMoney1(groupName: widget.groupName, groupId: widget.groupId, SplitId: SplitId, purpose: widget.purpose),
        },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Split Money Screen"),
        ),
        body: Container(
          child: Center(
            child: RefreshIndicator(
              onRefresh: () async {
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
              },
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => navigatorKey.currentState?.pushNamed('/updateSplitMoneyScreen',),
           /* Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => updateSplitMoneyScreen(
                            answer: widget.answer,
                            groupName: widget.groupName,
                            groupId: widget.groupId,
                            purpose: widget.purpose,
                            SplitId: SplitId,
                          ),
                        ),
                      ),*/
                      child: FutureBuilder(
                          future: onSplitMOney1(),
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
                          }),/*Card(
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
                                  height: size.height / 22,
                                  width: double.infinity,
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: (paid).toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: " added an expanse ->",
                                        ),
                                        TextSpan(
                                            text: "₹" + (totalMoney).toString(),
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
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white)),
                      ),*/
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

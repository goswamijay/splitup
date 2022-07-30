import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spilt_money_with_friend/updateAddMOney.dart';


import 'Expense Details Screen.dart';
import 'homepage.dart';

class updateSplitMoneyScreen extends StatefulWidget {
  static String id = 'updateSplitMoneyScreen';

  final String SplitId,groupId,groupName;
  final answer;
  final TextEditingController purpose;
  const updateSplitMoneyScreen({required this.SplitId,required this.groupId,required this.groupName,required this.answer,required this.purpose,Key? key}) : super(key: key);



  @override
  State<updateSplitMoneyScreen> createState() => _updateSplitMoneyScreenState();
}

class _updateSplitMoneyScreenState extends State<updateSplitMoneyScreen> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List< dynamic> membersList0 = [];
  List<Map<String, dynamic>> membersList = [];
  bool isLoading = true;
  TextEditingController purpose1= new TextEditingController();
  List<String> tempArray = [];


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
    await _firestore.collection('groups').doc(widget.groupId).collection(
        'chats').doc(widget.SplitId).update({
      "members": membersList0,

      "Who is Paid": _auth.currentUser!.email,
      "name": widget.groupName,
      "Total Money": widget.answer,
      "Purpose": purpose1.text,
      "Split Money": widget.answer / membersList0.length.toInt(),

    });

  }
  void DeleteList() async {
    await _firestore
        .collection('groups')
        .doc(widget.groupId)
        .collection('chats')
        .doc(widget.SplitId).delete();
    Fluttertoast.showToast(
        msg: "Split Items is deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => homepage()),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    int? selectedAge  ;

      final Size size = MediaQuery.of(context).size;
      DateTime dateTime = DateTime.now();
      TimeOfDay time = TimeOfDay.now();
      var division = widget.answer / tempArray.length.toInt();

      return Scaffold(
          appBar: AppBar(
            title: Text("Update Expense"),
            backgroundColor: Colors.pink,
              actions: [
              IconButton(onPressed: (){ DeleteList();},     icon: Icon(Icons.delete),
      ),
    ],
          ),
          body: SingleChildScrollView(
            child: Flex(//column and remove direction
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
                            icon: Icon(Icons.send), onPressed: UpdateMoney),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: size.height / 14,
                            width: size.width / 1.1,
                            child: TextField(
                              controller: purpose1,
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
                                                                  onTap: () =>
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              UpdateAddMoney1(
                                                groupId: widget.groupId,
                                                groupName: widget.groupName, SplitId: widget.SplitId, purpose: widget.purpose,
                                              )
                                        ),
                                      ),
                                  leading: Icon(Icons.account_circle),
                                  title: Text(membersList[index]['Name']),
                                  subtitle: Text(membersList[index]['Email']),
                                  trailing: Text("₹"+widget.answer.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                              onTap: () {},
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
                              onTap: () =>
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            UpdateAddMoney1(
                                              groupId: widget.groupId,
                                              groupName: widget.groupName, SplitId: widget.SplitId, purpose: widget.purpose,
                                            )
                                    ),
                                  ),
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
                              child:    Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Flexible(
                                  child: Text(
                                    '${dateTime.year}/${dateTime.month}/${dateTime.day}, ${time.hour}:${time.minute}',
                                    style:
                                    TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,

                              child: IconButton(
                                icon: Icon(Icons.calendar_today_outlined,color: Colors.pink,),
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: dateTime,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  //if 'CANCEL' => null
                                  if (newDate == null) return;
                                  else//if 'CANCEL' => DateTime
                                    setState(() {
                                      dateTime = newDate;
                                    });
                                  showTimePicker(context: context, initialTime: time);
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
            child:    Container(
              color: Colors.pink,
              child:Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {onPressed: UpdateMoney;},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("SAVE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
      );
    }

}

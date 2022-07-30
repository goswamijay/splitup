import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:spilt_money_with_friend/homepage.dart';

import 'Expense Details Screen.dart';
import 'Group Expense Screen.dart';
import 'information_of_group.dart';

class addMoney extends StatefulWidget {
  final String groupId, groupName;

  const addMoney({required this.groupName, required this.groupId, Key? key})
      : super(key: key);

  @override
  State<addMoney> createState() => _addMoneyState();
}

class _addMoneyState extends State<addMoney> {
  var userInput = '';
  var answer = 0.00;
  String dropdownvalue = 'Item 1';

  bool isLoading = true;
  List<dynamic> membersList = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

// Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'DEL',
    '=',
  ];
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
      membersList = chatMap['members'];
      print(membersList);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("New Expense"),

        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Container(
                        height:size.height/4,
                      color: Colors.grey[200],
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: membersList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => () {},
                              leading: Icon(Icons.account_circle),
                              title: Text(
                                membersList[index]['Name'],
                                style: TextStyle(
                                  fontSize: size.width / 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(membersList[index]['Email']),
                              trailing: Text(
                                  membersList[index]['isAdmin'] ? "" : ""),
                            );
                          },
                        ),
                      ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: (1 / 0.63)),
                    itemBuilder: (BuildContext context, int index) {
                      // Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput = '';
                              answer = 0;
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }

                      // +/- button
                      else if (index == 1) {
                        return MyButton(
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }
                      // % Button
                      else if (index == 2) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }
                      // Delete Button
                      else if (index == 18) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                      // Equal_to Button
                      else if (index == 19) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.orange[700],
                          textColor: Colors.white,
                        );
                      }

                      // other buttons
                      else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blue[50]
                              : Colors.black,
                          textColor: isOperator(buttons[index])
                              ? Colors.black
                              : Colors.white,
                        );
                      }
                    }), // GridView.builder
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Expense_Details_Screen(
                                answer: answer,
                                groupId: widget.groupId,
                                groupName: widget.groupName,
                              )),
                    );
                  }),
            ),
            IconButton(
                icon: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Expense_Details_Screen(
                              answer: answer,
                              groupId: widget.groupId,
                              groupName: widget.groupName,
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toDouble() as double;
  }
}

class MyButton extends StatelessWidget {
// declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

//Constructor
  MyButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

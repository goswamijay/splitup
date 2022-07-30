import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({Key? key}) : super(key: key);

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  bool _expanded = false;
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _expanded3 = false;
  bool _expanded4 = false;
  bool _expanded5 = false;
  bool _expanded6 = false;
  bool _expanded7 = false;
  bool _expanded8 = false;
  bool _expanded9 = false;
  bool _expanded10 = false;
  bool _expanded11 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Group circles are your friends!',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Group circles show the balances in the group. The bigger the circle, the bigger the debt. The person with the biggest debt in the middle should pay next. You can easily create a new expense with this member as the payer by clicking on the circle.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Long-press to access handy actions.',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'You can long-press various places in the app for quick actions: a transaction to edit or duplicate it, a group circle to edit that member, a member in a simple split to select only that member, and a group in My groups screen to edit that group.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded1,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded1 = !_expanded1;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Try using app shortcuts',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Another way to speed up new transactions is to use shortcuts. If you have Android 7+, you can long press the app icon and quickly add expenses, transfers or incomes. You can also drag the shortcut to the home screen for a permanent shortcut. The shortcut uses the last viewed group, if you want to change it, change the current tab in the app.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded2,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded2 = !_expanded2;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Automate recurring expenses',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'If you have expenses which you add periodically (e.g. monthly rent), consider setting them as a recurring transaction. They will be generated automatically and everyone will receive a notification when that happens. You can turn any transaction into a recurring one at the bottom of the transaction detail screen.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded3,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded3 = !_expanded3;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Add simple expenses quickly with a widget',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Are you in a rush? The quickest way to add an expense is to use our widget. You can enter only the amount, who paid and the expense is divided equally (with default shares in mind). The widget also shows who should pay next without launching the app. Protip: After adding the expense, you can click on the checkmark icon to open the app.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded4,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded4 = !_expanded4;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Say which member you are for better experience.',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'If you go to the member detail screen, you can check “This is me”. If you do that, this member (you) will be automatically pre-selected as who paid in future transactions. You will see a small dot next to the avatar which will highlight you.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded5,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded5 = !_expanded5;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Add member photos for a nicer group',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'When there is no member photo, we show a grey avatar with the first letter of the name. It could be confusing if you have multiple people with the same first letter. Add photos to members in the member detail and the whole app will be nicer and more intuitive.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded6,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded6 = !_expanded6;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'A member left the group? Disable them for new transactions',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'If somebody left your group, you don’t want to delete them permanently. That would alter the history and debts. However, you can edit the member and uncheck “Include this member in new transactions”. This member then won’t appear in future transactions.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded7,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded7 = !_expanded7;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Default share is useful for couples and families',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'When you edit a member, you can set a default share. If you set it to “2” for example, this member will count as two in all new transactions. It’s useful for couples and families – if these people act together as one financial unit, create one member with a higher default share.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded8,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded8 = !_expanded8;
                setState(() {

                });
              },
            ),

            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Turn off debt minimization to pay only direct debts',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'Our debt algorithm is battle-tested and you can rely on it. It minimizes the number of transactions between people by transferring debts, so you might end up paying to somebody you don’t directly owe. If you don’t like that, you can turn off debt minimization in the Edit group screen.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded9,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded9 = !_expanded9;
                setState(() {

                });
              },
            ),
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Debts are settled, now archive the groupWith old, ',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          'With old,inactive groups, it’s best to archive them. They won’t clutter the main screen and the app will load faster. Anyone can do this in the Edit group screen, when the debts are settled. Anybody can then preview the group from the My groups screen. Only the owner can restore the group.',
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded10,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded10 = !_expanded10;
                setState(() {

                });
              },
            ),
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 0,
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Do you miss the voice?',
                          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: ListTile(
                      title: Text(
                          "The old Settle Up app had a feature which would say who should pay out loud. We have something even better: Google Assistant, Alexa, and Cortana integrations which do that and more for all supported devices. Just tell your assistant, “Ask Settle Up who should pay”.",
                          style: TextStyle(color: Colors.black)),
                      tileColor: Colors.white,
                    ),
                    isExpanded: _expanded11,
                    canTapOnHeader: true,
                    backgroundColor: Colors.white),

              ],
              expansionCallback: (panelIndex, isExpanded) {
                _expanded11 = !_expanded11;
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

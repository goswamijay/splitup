import 'package:flutter/material.dart';

import 'Group Craete/add_existing_team_member.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        drawer: Container(
          width: 280,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'My Groups',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.add),
                  onTap: () {},
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
                      MaterialPageRoute(
                          builder: (context) => const add_new_team()),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Join a nearby group',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.near_me_sharp),
                  onTap: () {},
                ),
                Divider(thickness: 2),
                ListTile(
                  title: const Text(
                    'Send feedback',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.email_rounded),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'Tips',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.tips_and_updates_outlined),
                  onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    }
  }


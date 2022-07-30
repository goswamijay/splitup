import 'package:flutter/material.dart';

class aboutus extends StatefulWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("About Us"),

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Developed BY:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Text("Jay Goswami",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Er No:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Text("190210116024",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("College Name:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      Text("GEC Bhavnagar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Email Id:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                      Text("goswamijay@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Github User Name:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      Text("goswamijay",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
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

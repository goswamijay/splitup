import 'package:spilt_money_with_friend/homepage.dart';

import 'const.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();

}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    return Scaffold(

      backgroundColor: color1,
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 30,
              child: Text(
                "Orix",
                style: TextStyle(
                  color: color2,
                  letterSpacing: 2,
                  fontSize: 30,
                ),
              )),
          Positioned(
            top: 90,
            left: 30,
            child: Text(
              "Bill Splitter",
              style: TextStyle(
                color: color2,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: profilePicture(size),
          ),
          Positioned(
            top: 155,
            left: 30,
            child: billedContainer(size),
          ),
          Positioned(
            bottom: 250,
            left: 30,
            child: previousSplit(size),
          ),
          Positioned(
            top: 270,
            right: 50,
            child: Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: size.height / 4,
                width: size.width / 5,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 22,
                      child: image(size, "assets/1.png"),
                    ),
                    Positioned(
                      top: 55,
                      left: 22,
                      child: image(size, "assets/2.png"),
                    ),
                    Positioned(
                      left: 22,
                      top: 100,
                      child: image(size, "assets/3.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: nearbyFriends(size),
          ),
          Positioned(
            bottom: 165,
            left: 22,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: color2,
              elevation: 10,
              child: Container(
                height: size.height / 11,
                width: size.width / 5,
                child: Icon(
                  Icons.search,
                  color: color1,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nearbyFriends(Size size) {
    return Container(
      height: size.height / 3.7,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        color: color3,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 100,
            child: Text(
              "Nearby Friends",
              style: TextStyle(
                color: color2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: Text(
              "See all",
              style: TextStyle(
                color: color2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 105,
            child: previousParticipants(size, "assets/2.png", "user"),
          ),
          Positioned(
            top: 50,
            left: 175,
            child: previousParticipants(size, "assets/1.png", "me"),
          ),
          Positioned(
            top: 50,
            left: 245,
            child: previousParticipants(size, "assets/3.png", "user2"),
          ),
          Positioned(
            bottom: 70,
            left: 12,
            child: Text(
              "Recently Splits",
              style: TextStyle(
                color: color2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 6,
            child: recentSplits(size, "assets/1.png", "user1"),
          ),
          Positioned(
            left: 90,
            bottom: 6,
            child: recentSplits(size, "assets/2.png", "user2"),
          ),
          Positioned(
            right: 90,
            bottom: 6,
            child: recentSplits(size, "assets/1.png", "user3"),
          ),
          Positioned(
            right: 15,
            bottom: 6,
            child: recentSplits(size, "assets/3.png", "user4"),
          ),
        ],
      ),
    );
  }

  Widget recentSplits(Size size, String imageUrl, String name) {
    return Container(
      height: size.height / 10,
      width: size.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: size.height / 20,
            width: size.height / 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: color2,
            ),
          )
        ],
      ),
    );
  }

  Widget previousParticipants(Size size, String imageUrl, String name) {
    return Container(
      height: size.height / 10,
      width: size.width / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color1,
      ),
      child: Column(
        children: [
          Container(
            height: size.height / 14.5,
            width: size.width / 14.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: color2,
            ),
          )
        ],
      ),
    );
  }

  Widget previousSplit(Size size) {
    return Container(
      height: size.height / 9,
      width: size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color3,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 0.5,
            bottom: 0.5,
            child: Container(
              height: size.height / 7,
              width: size.width / 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color1,
              ),
              child: Icon(
                Icons.timer,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 80,
            child: Text(
              "Your Previous Splits",
              style: TextStyle(
                color: color2,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 80,
            child: Text(
              "678.56",
              style: TextStyle(
                color: color2,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget billedContainer(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color2,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Text(
              "Total Bill",
              style: TextStyle(
                color: color1,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 75,
            right: 30,
            child: Text(
              "Split With",
              style: TextStyle(
                color: color1,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 30,
            child: Text(
              "750.86",
              style: TextStyle(
                color: color1,
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => homepage(),
                ),
              ),
              child: Material(
                color: color1,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 3.5,
                  alignment: Alignment.center,
                  child: Text(
                    "Split Now",
                    style: TextStyle(
                      color: color2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(Size size, String imageUrl) {
    return Container(
      height: size.height / 10,
      width: size.width / 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
          )),
    );
  }

  Widget profilePicture(Size size) {
    return Container(
      height: size.height / 9.5,
      width: size.width / 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color3,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: size.height / 19,
              width: size.width / 5,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/1.png"))),
            ),
          ),
          Text(
            "User 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color2,
            ),
          )
        ],
      ),
    );
  }
}
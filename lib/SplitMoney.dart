import 'package:cloud_firestore/cloud_firestore.dart';

class Split{
 late String Purpose;
 late int SplitMoney;
 late int TotalMoney;
 late String WhoisPaid;
 late List members;
 late String name;

  Split.getMap(Map<String,dynamic> data){
    Purpose = data['Purpose'];
    SplitMoney = data['SplitMoney'];
    TotalMoney = data['TotalMoney'];
    WhoisPaid = data ['WhoisPaid'];
    members = data['members'];
    name = data['name'];
  }



}


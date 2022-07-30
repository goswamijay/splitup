import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'SplitMoney.dart';


class SplitMoneyNotifier with ChangeNotifier{
  List<Split> _split =[];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Split _userDetails;

  UnmodifiableListView<Split> get splitList => UnmodifiableListView(_split);
  Split get currentUser => _userDetails;

  set splitList (List<Split> splitList) {
    _split = splitList;
    notifyListeners();
  }

  set currentUser (Split split) {
    _userDetails = split;
    notifyListeners();
  }
}

getUser(SplitMoneyNotifier splitMoneyNotifier) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  QuerySnapshot snapshot = await _firestore.collection('groups').get();

  List <Split> _members = [];


}


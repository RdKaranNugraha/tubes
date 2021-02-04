// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:tubes/database/firestore.dart';
// import 'package:tubes/item.dart';
// import 'package:tubes/stnk/infopajak.dart';

// class ItemProvider extends ChangeNotifier {
//   List<Item> _item;
//   List<Item> get listitem => _item;

//   set listitem(List<Item> val) {
//     _item = val;
//     notifyListeners();
//   }
// }

import 'package:tubes/item.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  String uid;
  ItemProvider({this.uid});

  static Stream<List<Item>> fetchAll() {
    return Firestore.instance.collection('item').snapshots().map((list) =>
        list.documents.map((doc) => Item.fromFireStore(doc)).toList());
  }

  Stream<List<Item>> id() {
    return Firestore.instance
        .collection('item')
        .where('id', isEqualTo: uid)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Item.fromFireStore(doc)).toList());
  }
}

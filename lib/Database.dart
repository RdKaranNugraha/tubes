import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  static CollectionReference pajakCollection =
      Firestore.instance.collection('Pajak');

  static Future<void> createOrUpdatePajak(String id,
      {String name, int price}) async {
    await pajakCollection.document(id).setData({'nama': name, 'harga': price});
  }

  // static Future<DocumentSnapshot> getPajak(String id) async {
  //   return await pajakCollection.document(id).get();
  // }
}

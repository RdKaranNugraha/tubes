import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class FirestoreDatabase {
  static CollectionReference pajakCollection =
      Firestore.instance.collection('Pajak');

  static Future<void> createOrUpdatePajak(String id,
      {String user,
      String nomorPolisi,
      String nik,
      String nohp,
      String emailstnk,
      String norangka,
      String bayar,
      String harga}) async {
    await pajakCollection.document(id).setData({
      'user': user,
      'nomorpolisi': nomorPolisi,
      'nik': nik,
      'nohp': nohp,
      'email': emailstnk,
      'norangka': norangka,
      'pembayaran': bayar,
      'harga': harga
    }, merge: true);
  }
  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask task = ref.putFile(imageFile);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
}

  
}


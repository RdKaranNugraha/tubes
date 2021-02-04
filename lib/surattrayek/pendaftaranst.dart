import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/database/firestore.dart';

class PendaftaranST extends StatefulWidget {
  @override
  _PendaftaranSTState createState() => _PendaftaranSTState();
}

class _PendaftaranSTState extends State<PendaftaranST> {
  @override
  String imagePath;

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Perpanjangan Surat Trayek"),
      ),
      backgroundColor: Colors.green,
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            (imagePath != null)
                ? Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                  )
                : Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black))),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text("Upload"),
                onPressed: () async {
                  File file = await getImage();
                  imagePath = await FirestoreDatabase.uploadImage(file);

                  setState(() {});
                })
          ]),
        ),
      ),
    );
  }
}

Future<File> getImage() async {
  return await ImagePicker.pickImage(source: ImageSource.gallery);
}

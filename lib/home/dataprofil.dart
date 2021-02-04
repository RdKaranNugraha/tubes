import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tubes/database/firestore.dart';

class DataProfil extends StatefulWidget {
  @override
  _DataProfilState createState() => _DataProfilState();
}

class _DataProfilState extends State<DataProfil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Profil"),
          ),
          body: Container(
            child: Center(
                child: Column(
              children: [
                // RaisedButton(
                //     child: Text("get Data"),
                //     onPressed: () async {
                //       DocumentSnapshot snapshot =
                //           await FirestoreDatabase.getPajak("1");
                //       print(snapshot.data['nama']);
                //       print(snapshot.data['harga']);
                //     }),
                SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Kembali',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
              ],
            )),
          ),
        ));
  }
}

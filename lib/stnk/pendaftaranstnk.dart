import 'package:flutter/material.dart';
import 'package:tubes/database/firestore.dart';

class PendaftaranSTNK extends StatefulWidget {
  @override
  _PendaftaranSTNKState createState() => _PendaftaranSTNKState();
}

class _PendaftaranSTNKState extends State<PendaftaranSTNK>
    with SingleTickerProviderStateMixin {
  TextEditingController nomorpolisiController = TextEditingController(text: "");
  TextEditingController nikController = TextEditingController(text: "");
  TextEditingController nomorrangkaController = TextEditingController(text: "");
  TextEditingController nohpController = TextEditingController(text: "");
  TextEditingController emailstnkController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Pendaftaran STNK"),
        ),
        backgroundColor: Colors.green,
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[100]))),
                            child: TextField(
                              controller: nomorpolisiController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Nomor Polisi",
                                  hintText: "Masukkan Nomor Polisi",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nikController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Nomor Induk KTP (NIK)",
                                  hintText: "Masukkan Nomor Induk KTP",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nomorrangkaController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "No.Rangka(5 digit terakhir)",
                                  hintText:
                                      "Masukkan 5 digit terakhir no.rangka",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nohpController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "No.HP",
                                  hintText: "Masukkan Nomor Handphone/Whatsapp",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailstnkController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "E-mail",
                                  hintText: "Masukkan Alamat Email",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      child: Center(
                        child: Column(
                          children: [
                            RaisedButton(
                              color: Colors.white,
                                child: Text("Daftar"),
                                onPressed: () {
                                  FirestoreDatabase.createOrUpdatePajak(
                                      "$nomorpolisiController",
                                      nomorPolisi: "$nomorpolisiController",
                                      nik: "$nikController",
                                      norangka: "$nomorrangkaController",
                                      nohp: "$nohpController",
                                      emailstnk: "$emailstnkController");
                                })
                          ],
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ));
  }
}

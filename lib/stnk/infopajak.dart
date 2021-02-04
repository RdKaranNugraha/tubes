import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes/database/firestore.dart';
import 'package:tubes/main.dart';

class InfoPajakSTNK extends StatefulWidget {
  @override
  _InfoPajakSTNKState createState() => _InfoPajakSTNKState();
}

class _InfoPajakSTNKState extends State<InfoPajakSTNK> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(backgroundColor: Colors.green, title: Text("Pembayaran")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("Pajak")
                // .where("id", isEqualTo: user)
                .snapshots(),
            builder: (context, snapshots) {
              if (!snapshots.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return DetailPajak(listpajak: snapshots.data.documents);
            }),
      ),
    );
  }
}

class DetailPajak extends StatelessWidget {
  final List<DocumentSnapshot> listpajak;

  const DetailPajak({Key key, this.listpajak}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listpajak == null ? 0 : listpajak.length,
      itemBuilder: (context, i) {
        String nomorPolisi = listpajak[i].data["nomorPolisi"].toString();
        String nik = listpajak[i].data["nik"].toString();
        String harga = listpajak[i].data["harga"].toString();
        String jatuhTempo = listpajak[i].data["jatuhTempo"].toString();
        String norangka = listpajak[i].data["norangka"].toString();
        String user = listpajak[i].data["user"].toString();
        String emailstnk = listpajak[i].data["emailstnk"].toString();
        String nohp = listpajak[i].data["nohp"].toString();

        return ListTile(
          title: Column(
            children: [
              Text("Nomor Polisi  : $nomorPolisi"),
              Text("NIK             : $nik"),
              Text("Harga             : $harga"),
            ],
          ),
          subtitle: Column(
            children: [
              Text("Nomor Rangka : $norangka"),
              Text("Jatuh Tempo  : $jatuhTempo"),
              RaisedButton(
                  child: Text("Bayar Lunas"),
                  onPressed: () {
                    FirestoreDatabase.createOrUpdatePajak(nomorPolisi,
                        bayar: "Lunas",
                        nomorPolisi: nomorPolisi,
                        harga: harga,
                        nik: nik,
                        norangka: norangka,
                        user: user,
                        emailstnk: emailstnk,
                        nohp: nohp);
                  }),
              RaisedButton(
                  child: Text("Bayar PayLater"),
                  onPressed: () {
                    FirestoreDatabase.createOrUpdatePajak(nomorPolisi,
                        bayar: "PayLater",
                        nomorPolisi: nomorPolisi,
                        harga: harga,
                        nik: nik,
                        norangka: norangka,
                        user: user,
                        emailstnk: emailstnk,
                        nohp: nohp);
                  })
            ],
          ),
        );
      },
    );
  }
}

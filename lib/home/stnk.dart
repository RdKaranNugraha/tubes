import 'package:flutter/material.dart';
import 'package:tubes/stnk/infopajak.dart';
import 'package:tubes/stnk/panduan.dart';
import 'package:tubes/stnk/pendaftaranstnk.dart';

class STNK extends StatefulWidget {
  @override
  _STNKState createState() => _STNKState();
}

class _STNKState extends State<STNK> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("STNK"),
        ),
        backgroundColor: Colors.green,
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 3.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PanduanSTNK()));
                          },
                          child: Text('Panduan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ))
                      ],
                    ))),
            SizedBox(height: 20.0),
            Container(
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 3.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PendaftaranSTNK()));
                          },
                          child: Text('Pendaftaran Perpanjangan STNK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ))
                      ],
                    ))),
            SizedBox(height: 20.0),
            Container(
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 3.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPajakSTNK()));
                          },
                          child: Text('Info & Pembayaran Pajak',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ))
                      ],
                    ))),
          ],
        ));
  }
}

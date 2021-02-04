import 'package:flutter/material.dart';
import 'package:tubes/surattrayek/pendaftaranst.dart';

class SuratTrayek extends StatefulWidget {
  @override
  _SuratTrayekState createState() => _SuratTrayekState();
}

class _SuratTrayekState extends State<SuratTrayek>
    with SingleTickerProviderStateMixin {
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
          title: Text("Surat Trayek"),
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
                          child: Text('Panduan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        )
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
                                    builder: (context) => PendaftaranST()));
                          },
                          child: Text('Pendaftaran Perpanjangan Surat Trayek',
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
                          child: Text('Pembayaran Retribusi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        )
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
                          child: Text('Info Proses',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        )
                      ],
                    )))
          ],
        ));
  }
}

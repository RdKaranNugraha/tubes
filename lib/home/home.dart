import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes/home/SuratTrayek.dart';
import 'package:tubes/auth/auth_services.dart';
import 'package:tubes/home/dataprofil.dart';
import 'package:tubes/home/stnk.dart';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/database/firestore.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String imagePath;

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("PST & STNK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Container(
                  child: Center(
                    child: Column(children: [
                      (imagePath != null)
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                          child: Text("Upload Gambar"),
                          onPressed: () async {
                            File file = await getImage();
                            imagePath =
                                await FirestoreDatabase.uploadImage(file);

                            setState(() {});
                          })
                    ]),
                  ),
                ),
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
                        borderRadius: BorderRadius.circular(30.0)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataProfil()));
                      },
                      child: Container(
                        child: Text('Profil',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                    child: Text("SignOut"),
                    onPressed: () async {
                      await AuthServices.signOut();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Colors.green,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("Home",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 22,
                                  )
                                ])),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 22,
                                  )
                                ])),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 22,
                                  )
                                ])),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Info dan Layanan",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                              child: Text("STNK",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.white,
                              elevation: 5,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => STNK()));
                              }),
                        ]),
                  ),
                  Container(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                              child: Text("Surat Trayek",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.white,
                              elevation: 5,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SuratTrayek()));
                              }),
                        ]),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Pembayaran",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // RaisedButton(
                          //     child: Text("Pembayaran",
                          //         style: TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.bold)),
                          //     color: Colors.white,
                          //     elevation: 5,
                          //     onPressed: () {
                          //       Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => Pembayaran()));
                          //     }),
                          // RaisedButton(
                          //     child: Text("Bukti Pembayaran",
                          //         style: TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.bold)),
                          //     color: Colors.white,
                          //     elevation: 5,
                          //     onPressed: () {
                          //       Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => BuktiPembayaran()));
                          //     }),
                        ]),
                  ),
                  // SizedBox(height: 50),
                  // Container(
                  //   height: 200,
                  //   child: new Row(
                  //     children: <Widget>[
                  //       Icon(Icons.home, color: Colors.white),
                  //       Icon(Icons.skip_previous, color: Colors.white),
                  //       Icon(Icons.skip_next, color: Colors.white),
                  //       Icon(Icons.share, color: Colors.white),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 30),
                  Text(
                    "Perpanjang STNK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("NoPolisi"),
                          subtitle: Text("Jenis Kendaraan"),
                          trailing: Text("Total"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 16);
                      },
                      itemCount: 2),
                  SizedBox(height: 30),
                  Text(
                    "Perpanjang Surat Trayek",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Angkutan Umum/Bus"),
                          subtitle: Text("Jalur Trayek"),
                          trailing: Text("Total"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 16);
                      },
                      itemCount: 2)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<File> getImage() async {
  return await ImagePicker.pickImage(source: ImageSource.gallery);
}

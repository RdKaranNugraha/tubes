// import 'package:flutter/material.dart';
// import 'package:tubes/home/home.dart';

// class Pendaftaran extends StatefulWidget {
//   @override
//   _PendaftaranState createState() => _PendaftaranState();
// }

// class _PendaftaranState extends State<Pendaftaran> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         backgroundColor: Colors.green,
//         resizeToAvoidBottomPadding: false,
//         body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
//             Widget>[
//           Container(
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
//                   child: Text(
//                     'Daftar',
//                     style:
//                         TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(240.0, 115.0, 0.0, 0.0),
//                   child: Text(
//                     '.',
//                     style: TextStyle(
//                         fontSize: 80.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//               padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//               child: Column(
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(
//                         labelText: 'EMAIL',
//                         labelStyle: TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black))),
//                   ),
//                   SizedBox(height: 10.0),
//                   TextField(
//                     decoration: InputDecoration(
//                         labelText: 'PASSWORD ',
//                         labelStyle: TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black))),
//                     obscureText: true,
//                   ),
//                   SizedBox(height: 10.0),
//                   TextField(
//                     decoration: InputDecoration(
//                         labelText: 'NICK NAME ',
//                         labelStyle: TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black))),
//                   ),
//                   SizedBox(height: 50.0),
//                   Container(
//                     height: 60.0,
//                     color: Colors.transparent,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Colors.black,
//                               style: BorderStyle.solid,
//                               width: 1.0),
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(20.0)),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) => Home()));
//                         },
//                         child: Center(
//                           child: Text('SIGN UP',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Montserrat')),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Container(
//                     height: 40.0,
//                     color: Colors.transparent,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Colors.transparent,
//                               style: BorderStyle.solid,
//                               width: 1.0),
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(20.0)),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Center(
//                           child: Text('Go Back',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Montserrat')),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           // SizedBox(height: 15.0),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: <Widget>[
//           //     Text(
//           //       'New to Spotify?',
//           //       style: TextStyle(
//           //         fontFamily: 'Montserrat',
//           //       ),
//           //     ),
//           //     SizedBox(width: 5.0),
//           //     InkWell(
//           //       child: Text('Register',
//           //           style: TextStyle(
//           //               color: Colors.green,
//           //               fontFamily: 'Montserrat',
//           //               fontWeight: FontWeight.bold,
//           //               decoration: TextDecoration.underline)),
//           //     )
//           //   ],
//           // )
//         ]));
//   }
// }
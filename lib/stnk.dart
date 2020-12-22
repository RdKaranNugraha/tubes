import 'package:flutter/material.dart';
import 'package:tubes/home.dart';
import 'panduan.dart' as panduan;
import 'pendaftaran.dart' as pendaftaran;
import 'infopajak.dart' as infopajak;
import 'pengaduan.dart' as pengaduan;

class STNK extends StatefulWidget {
  @override
  _STNKState createState() => _STNKState();
}

class _STNKState extends State<STNK> with SingleTickerProviderStateMixin {
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
      backgroundColor: Colors.green, //
      body: Stack(
        children: <Widget>[
          menu(context),
          stnk(context),
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
                SizedBox(height: 10),
                Text("Rd Karan Nugraha",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                SizedBox(height: 10),
                Text("NoTelepon",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
                SizedBox(height: 10),
                Text("089626156656",
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stnk(context) {
    {
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
                      children: <Widget>[
                        InkWell(
                          child: Icon(Icons.home, color: Colors.white),
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
                        Text("STNK",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

// create appBar
// appBar: new AppBar(
//   backgroundColor: Colors.lightGreen,
//   leading: new Icon(Icons.menu),
//   title: new Text("STNK"),
//         bottom: new TabBar(
//           controller: controller,
//           //source code lanjutan
//           tabs: <Widget>[
//             new Tab(
//               icon: new Icon(Icons.verified_outlined),
//               text: "Info Pajak",
//             ),
//             new Tab(
//               icon: new Icon(Icons.feedback),
//               text: "Pembayaran",
//             ),
//             new Tab(
//               icon: new Icon(Icons.info_outlined),
//               text: "Bukti Pembayaran",
//             ),
//             new Tab(
//               icon: new Icon(Icons.book),
//               text: "Panduan",
//             ),
//           ],
//         ),
//       ),
//       body: new TabBarView(
//         //controller untuk tab bar
//         controller: controller,
//         children: <Widget>[
//           new pendaftaran.Pendaftaran(),
//           new pengaduan.Pengaduan(),
//           new infopajak.Infopajak(),
//           new panduan.Panduan(),
//         ],
//       ),
//     );
//   }
// }

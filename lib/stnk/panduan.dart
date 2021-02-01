// import 'package:day12_login/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class PanduanSTNK extends StatefulWidget {
  @override
  _PanduanSTNKState createState() => _PanduanSTNKState();
}

class _PanduanSTNKState extends State<PanduanSTNK> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Panduan"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/motor.png'))),
                      ),
                    ),
                    Positioned(
                      left: 150,
                      width: 80,
                      height: 320,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bus.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/jam.png'))),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Panduan STNK",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                    )
                  ]))
            ],
          ),
        ));
  }
}

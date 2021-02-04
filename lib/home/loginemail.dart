import 'package:flutter/material.dart';
import 'package:tubes/auth/auth_services.dart';

class LoginEmail extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 55.0, 0.0, 0.0),
                      child: Text('PST',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(70.0, 175.0, 0.0, 0.0),
                      child: Text('STNK',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(110.0, 120.0, 0.0, 0.0),
                      child: Text('&',
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                      child: Text("Demo"),
                      onPressed: () async {
                        await AuthServices.signInAnonymous();
                      }),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                      child: Text("Sig In"),
                      onPressed: () async {
                        await AuthServices.signIn(
                            emailController.text, passwordController.text);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                      child: Text("Sig Up"),
                      onPressed: () async {
                        await AuthServices.signUp(
                            emailController.text, passwordController.text);
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}

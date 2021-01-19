import 'package:flutter/material.dart';

import 'auth/auth_services.dart';

class LoginEmail extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Login Gmail"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: emailController,
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: passwordController,
                ),
              ),
              RaisedButton(
                  child: Text("Sign In Gmail"),
                  onPressed: () async {
                    await AuthServices.signIn(emailController.text, passwordController.text);
                  }),
              RaisedButton(
                  child: Text("sign Up"),
                  onPressed: () async {
                    await AuthServices.signUp(
                        emailController.text, passwordController.text);
                  }),
            ],
          ),
        ));
  }
}

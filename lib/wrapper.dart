import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes/home/home.dart';
import 'package:tubes/home/loginemail.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    return (firebaseUser == null) ? LoginEmail() : Home(firebaseUser);
  }
}

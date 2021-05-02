import'package:flutter/material.dart';
import 'package:ruhack/Register.dart';
import 'package:ruhack/SignIn.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool reg = true;

  @override
  Widget build(BuildContext context) {
    return reg?Register(toggle:change):SignIn(toggle:change);
  }

  void change()
  {
    setState(() {
      reg =!reg;
    });
  }
}

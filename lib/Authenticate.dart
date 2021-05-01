import 'package:flutter/material.dart';
import 'package:ruhack/Register.dart';
import 'package:ruhack/SignIn.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return toggle?Register(toggleView: changePage,):SignIn(toggleView: changePage);
  }

  void changePage(){
    setState(() {
      toggle = !toggle;
    });
  }



}

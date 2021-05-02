import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruhack/MainSxreen.dart';
import 'package:ruhack/authenticate_services.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticateSerivice().user,
      child: MainScreen(),
    );
  }
}

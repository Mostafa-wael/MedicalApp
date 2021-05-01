import 'package:flutter/material.dart';
import 'Authenticate.dart';
import 'Register.dart';
import 'SignIn.dart';
import 'profile.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      primaryColorDark: Colors.blue[900],
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.blue[900], // top bar color
      backgroundColor: Colors.grey[900], // app backgroundColor
      // Define the default font family.
      fontFamily: 'Georgia',
      // Define the default TextTheme.
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.grey[100], fontSize: 24),
        subtitle2: TextStyle(letterSpacing: 2.0, color: Colors.grey[600]),
        bodyText2: TextStyle(
          letterSpacing: 2.0,
          color: Colors.blue[900],
          fontSize: 30.0,
          fontFamily: 'Redressed',
        ),
      ),
    ),
    title: 'Medical App',
    home: firstTestPage(),
  ));
}

class firstTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Route'),
      ),
      body: ListView(children: [
        ElevatedButton(
          child: Text('Open profile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        ElevatedButton(
          child: Text('Open Authenticate'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Authenticate()),
            );
          },
        ),
        ElevatedButton(
          child: Text('Open Sign-in'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
        ),
        ElevatedButton(
          child: Text('Open Register'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
        )
      ]),
    );
  }
}
//  Navigator.pop(context);

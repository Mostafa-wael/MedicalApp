import 'package:flutter/material.dart';
import 'package:ruhack/Authenticate.dart';
import 'package:ruhack/Register.dart';
import 'package:ruhack/SignIn.dart';
import 'package:ruhack/profile.dart';

<<<<<<< HEAD
// void main() => runApp(MaterialApp(
//     theme: ThemeData(
//       // theme
//     var darkThemeHeaderColor = Colors.grey; // data color
//     var darkThemeScaffoldColor =
//         Colors.grey[100]; // text in the appBar and the floatingActionButton

//       // Define the default brightness and colors.
//       primaryColorDark: Colors.blue[900],

//       brightness: Brightness.dark,
//       scaffoldBackgroundColor: Colors.grey[900],

//       // Define the default font family.
//       fontFamily: 'Redressed',

//       // Define the default TextTheme. Use this to specify the default
//       // text styling for headlines, titles, bodies of text, and more.
//       textTheme: TextTheme(
//         subtitle2: TextStyle(letterSpacing: 2.0, color: darkThemeHeaderColor),
//         bodyText2: TextStyle(
//           letterSpacing: 2.0,
//           color: primaryColorDark,
//           fontSize: 30.0,
//           fontFamily: 'Redressed',
//         ),
//       ),
//     ),
//     home: Profile()));
void main() {
  runApp(MaterialApp(
    title: 'Medical App',
    home: firstTestPage(),
  ));
}

class firstTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open profile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
      ),
    );
  }
}

class secondTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
=======
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}

>>>>>>> 6a8ea192c3399db3bc226a05bc1c04740a32aa35

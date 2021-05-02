import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MedicalHistory.dart';
import 'package:provider/provider.dart';
import 'package:ruhack/authenticate_services.dart';

class Profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<Profile> {
  // data
  final String name = "Mostafa Wael";
  final int age = 21;
  final String phoneNumber = "011";
  final String gender = "Male";
  final _auth = AuthenticateSerivice();
  //********************************
  @override
  Widget build(BuildContext context) {
    // text style
    var dataTextStyle = Theme.of(context).textTheme.bodyText2;
    var headerTextStyle = Theme.of(context).textTheme.subtitle2;
    var scaffoldTextStyle = Theme.of(context).textTheme.headline1;

    // profile photo
    var circleAvatar = CircleAvatar(
      backgroundImage: AssetImage('assets/profile.png'),
      radius: 60.0,
    );
    // /headers
    var nameHeader = Text(
      'Name',
      style: headerTextStyle,
    );
    var ageHeader = Text(
      'Age',
      style: headerTextStyle,
    );
    var phoneNumberHeader = Text(
      'Phone Number',
      style: headerTextStyle,
    );
    var genderHeader = Text(
      'Gender',
      style: headerTextStyle,
    );
    // data
    var nameData = Text(
      name,
      style: dataTextStyle,
    );
    var ageData = Text(
      age.toString(),
      style: dataTextStyle,
    );
    var phoneNumberData = Text(
      phoneNumber,
      style: dataTextStyle,
    );
    var genderData = Text(
      gender,
      style: dataTextStyle,
    );
    //********************************
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //************
      appBar: AppBar(
        leading: Icon(Icons.medical_services),
        title: Text('Medical App', style: scaffoldTextStyle),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.logOut();
              },
              icon: Icon(Icons.logout),
              label: Text('Log Out'),
              style: TextButton.styleFrom(primary: Colors.white))
        ],
      ),
      //************
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Center(
            child: circleAvatar,
          ),
          nameHeader,
          SizedBox(height: 10.0),
          nameData,
          SizedBox(height: 20.0),
          ageHeader,
          SizedBox(height: 10.0),
          ageData,
          SizedBox(height: 20.0),
          phoneNumberHeader,
          SizedBox(height: 10.0),
          phoneNumberData,
          SizedBox(height: 20.0),
          genderHeader,
          SizedBox(height: 10.0),
          genderData,
          SizedBox(height: 20.0),
        ],
      ),
      //************
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //************
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => History()),
          );

          // setState(() {});
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) => new AlertDialog(
          //           title: new Icon(
          //             Icons.all_inclusive_sharp,
          //             color: Theme.of(context).scaffoldBackgroundColor,
          //           ),
          //           content: new Text(
          //             'YOU ARE GREAT!',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               letterSpacing: 2.0,
          //               color: Theme.of(context).scaffoldBackgroundColor,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           actions: <Widget>[
          //             new IconButton(
          //                 icon: new Icon(
          //                   Icons.close,
          //                   color: Theme.of(context).scaffoldBackgroundColor,
          //                 ),
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 })
          //           ],
          //         ));
        },
      ),
    );
  }
}

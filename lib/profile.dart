import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

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
  final notes = [];
  //********************************
  @override
  Widget build(BuildContext context) {
    notes.clear();
    notes.add("1");
    notes.add("2");
    notes.add("3");
    //********************************
    // theme
    var darkThemeDataColor = Colors.blue[900]; // header color
    var darkThemeHeaderColor = Colors.grey; // data color
    var darkThemebackgroundColor = Colors.grey[900]; // background color
    var darkThemeScaffoldColor =
        Colors.grey[100]; // text in the appBar and the floatingActionButton
    // text style
    var dataTextStyle = TextStyle(
      letterSpacing: 2.0,
      color: darkThemeDataColor,
      fontSize: 30.0,
      fontFamily: 'Redressed',
    );
    var headerTextStyle =
        TextStyle(letterSpacing: 2.0, color: darkThemeHeaderColor);
    var scaffoldTextStyle = TextStyle(color: darkThemeScaffoldColor);
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
    var notesHeader = Text(
      'Additional Notes',
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
    var notesData = Text(
      notes.join(", "),
      style: dataTextStyle,
    );
    //********************************
    var scaffold = Scaffold(
      backgroundColor: darkThemebackgroundColor,
      //************
      appBar: AppBar(
        title: Text('Medical App', style: scaffoldTextStyle),
        centerTitle: true,
        backgroundColor: darkThemeDataColor,
        elevation: 0.0,
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
          notesHeader,
          SizedBox(height: 10.0),
          notesData,
          SizedBox(height: 20.0),
        ],
      ),
      //************
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkThemeDataColor,
        //************
        child: Text(
          '!',
          style: scaffoldTextStyle,
        ),
        //************
        onPressed: () {
          setState(() {});
          showDialog(
              context: context,
              builder: (BuildContext context) => new AlertDialog(
                    title: new Icon(
                      Icons.all_inclusive_sharp,
                      color: darkThemeDataColor,
                    ),
                    content: new Text(
                      'YOU ARE GREAT!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: darkThemeDataColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: <Widget>[
                      new IconButton(
                          icon: new Icon(
                            Icons.close,
                            color: darkThemeDataColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ));
        },
      ),
    );
    return scaffold;
  }
}

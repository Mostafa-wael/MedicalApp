import 'package:flutter/material.dart';
import 'package:ruhack/Register.dart';
import 'package:ruhack/authenticate_services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;
  bool visible = true;
  final _auth = AuthenticateSerivice();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // headers
    var emailHeader = Text(
      'Email',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var passwordHeader = Text(
      'Password',
      style: Theme.of(context).textTheme.subtitle2,
    );
    //********************************
    // Text Fields
    var getEmail = TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      validator: (val) => val.isEmpty ? "Enter your email" : null,
      onChanged: (val) {
        setState(() {
          email = val;
        });
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Email',
          prefixIcon: Icon(Icons.email_rounded),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          )),
    );
    var getPassword = TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      validator: (val) => val.isEmpty ? "Enter your password" : null,
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      obscureText: visible,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Password',
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          )),
    );
    var signInButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).scaffoldBackgroundColor),
      child:
          Text('Sign in', style: TextStyle(fontSize: 12, color: Colors.white)),
      onPressed: () async {
        if (_formkey.currentState.validate()) {
          dynamic result = await _auth.logIn(email, password);
          if(result==null){
            showDialog(
                context: context,
                builder: (BuildContext context) => new AlertDialog(
                  title: new Icon(
                    Icons.error,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  content: new Text(
                    'Invalid User Credentials',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.close,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ));
          }
        }
      },
    );
    //********************************
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //************
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Icon(Icons.medical_services),
        title:
            Text('Medical App', style: Theme.of(context).textTheme.headline1),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            icon: Icon(Icons.app_registration),
            label: Text('Not a member?'),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      //************
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                emailHeader,
                SizedBox(height: 10.0),
                getEmail,
                SizedBox(height: 20),
                passwordHeader,
                SizedBox(height: 10.0),
                getPassword,
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  signInButton,
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

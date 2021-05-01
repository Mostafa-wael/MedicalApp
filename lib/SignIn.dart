import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;
  bool visible = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: Icon(Icons.medical_services),
          title: Text('Medical App'),
          actions: [
            TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.app_registration),
              label: Text('Not a member?'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(20),
          color: Color.fromRGBO(0, 180, 180, 0.3),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
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
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val.isEmpty ? "Enter your password" : null,
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
                          icon: Icon(visible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        )),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        print('validate');
                      } else {
                        print('error');
                      }
                    },
                    child: Text('Sign in'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

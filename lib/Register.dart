import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: non_constant_identifier_names
  String first_name, last_name, email, password, confirm_pass, phone_number;
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
              icon: Icon(Icons.login),
              label: Text('Already a member?'),
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
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? "Enter your name" : null,
                    onChanged: (val) {
                      setState(() {
                        first_name = val;
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'First Name',
                        prefixIcon: Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        )),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val.isEmpty ? "Enter your last name" : null,
                    onChanged: (val) {
                      setState(() {
                        last_name = val;
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Last Name',
                        prefixIcon: Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        )),
                  ),
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
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val != password ? "Your passwords do not match" : null,
                    onChanged: (val) {
                      setState(() {
                        confirm_pass = val;
                      });
                    },
                    obscureText: visible,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Confirm Password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        )),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.length < 11 ? "Enter a correct phone number" : null,
                    onChanged: (val) {
                      setState(() {
                        phone_number = val;
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        )),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        print('validate');
                      } else {
                        print('error');
                      }
                    },
                    child: Text('Register'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

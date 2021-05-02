import 'package:flutter/material.dart';
import 'package:ruhack/SignIn.dart';
import 'package:ruhack/authenticate_services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: non_constant_identifier_names
  String first_name, last_name, email, password, confirm_pass, phone_number, age, gender = 'Male';
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
    var ageHeader = Text(
      'Age',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var genderHeader = Text(
      'Gender',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var passwordHeader = Text(
      'Password',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var firstNameHeader = Text(
      'First Name',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var lastNameHeader = Text(
      'Last Name',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var confirmPasswordHeader = Text(
      'Confirm Password',
      style: Theme.of(context).textTheme.subtitle2,
    );
    var phoneNumberHeader = Text(
      'Phone Number',
      style: Theme.of(context).textTheme.subtitle2,
    );
    //********************************
    // Text Fields
    var getFirstName = TextFormField(
      style: TextStyle(color: Colors.black),
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
    );
    var getLastName = TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      validator: (val) => val.isEmpty ? "Enter your last name" : null,
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
    );
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
    var confirmPassword = TextFormField(
      style: TextStyle(color: Colors.black),
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
    );
    var getPhoneNumber = TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      validator: (val) =>
          val.length < 11 || int.tryParse(val)==null? "Enter a correct phone number" : null,
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
    );

    var getAge = TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      validator: (val) =>
      int.tryParse(val)==null && (int.parse(val) >0 && int.parse(val) <=150)? "Enter a valid age" : null,
      onChanged: (val) {
        setState(() {
          age = val;
        });
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Age',
          prefixIcon: Icon(Icons.data_usage),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          )),
    );
    var getGender = DropdownButtonFormField(items:<String>['Male','Female']
            .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value, style: TextStyle(color: Colors.black),),
      );
    }).toList(),
      value: gender,
      onChanged: (val){
      setState(() {
        gender=val;
      });
      },
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,

      ),
    );
    var registerButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).scaffoldBackgroundColor),
        child: Text('Register',
            style: TextStyle(fontSize: 12, color: Colors.white)),
        onPressed: () async {
          if (_formkey.currentState.validate()) {
            dynamic result = await _auth.signUp(first_name, last_name, int.parse(phone_number), email, password, int.parse(age), gender);
            if(result==null)
              {
              showDialog(
              context: context,
              builder: (BuildContext context) => new AlertDialog(
              title: new Icon(
              Icons.error,
              color: Theme.of(context).scaffoldBackgroundColor,
              ),
              content: new Text(
                'Please, Enter a valid email address\n Email is invalid or already used',
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
          }
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
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
            icon: Icon(Icons.login),
            label: Text('Already a member?'),
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
                firstNameHeader,
                SizedBox(height: 10.0),
                getFirstName,
                SizedBox(height: 20),
                lastNameHeader,
                SizedBox(height: 10.0),
                getLastName,
                SizedBox(height: 20),
                emailHeader,
                SizedBox(height: 10.0),
                getEmail,
                SizedBox(height: 20),
                passwordHeader,
                SizedBox(height: 10.0),
                getPassword,
                SizedBox(height: 20),
                confirmPasswordHeader,
                SizedBox(height: 10.0),
                confirmPassword,
                SizedBox(height: 20.0),
                ageHeader,
                SizedBox(height: 10.0),
                getAge,
                SizedBox(height: 20),
                phoneNumberHeader,
                SizedBox(height: 10.0),
                getPhoneNumber,
                SizedBox(height: 10.0),
                genderHeader,
                SizedBox(height: 10.0),
                getGender,
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  registerButton,
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

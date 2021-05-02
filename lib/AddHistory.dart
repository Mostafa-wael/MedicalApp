import 'package:flutter/material.dart';
import 'Receipt.dart';
import 'ReceiptCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ruhack/SignIn.dart';
import 'package:ruhack/authenticate_services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddHistory extends StatefulWidget {
  @override
  _AddHistoryState createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {

  TextEditingController titleconrtoller = TextEditingController();
  TextEditingController dateconrtoller = TextEditingController();
  TextEditingController descriptionconrtoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "Add Medical History",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[400],
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: titleconrtoller,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Title',
                    prefixIcon: Icon(Icons.data_usage),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    )),
              ),
              SizedBox(height: 40),
              TextFormField(
                readOnly: true,
                controller: dateconrtoller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'date',
                    prefixIcon: Icon(Icons.data_usage),
                    suffixIcon:  IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1960, 1, 1),
                            maxTime: DateTime(DateTime.now().year, 12, 31),
                            onConfirm: (date) {
                          dateconrtoller.text = "${date.year.toString()}-${date.month.toString()}-${date.day.toString()}";
                              print('confirm $date');
                            },
                            currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    )),
              ),
              SizedBox(height: 40),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'description',
                    prefixIcon: Icon(Icons.data_usage),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    )),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

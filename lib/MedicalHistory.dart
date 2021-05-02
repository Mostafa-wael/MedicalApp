import 'package:flutter/material.dart';
import 'Receipt.dart';
import 'ReceiptCard.dart';
import 'AddHistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<Receipt> cards = [
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now()),
    Receipt(name:"Osama",date: new DateTime.now())
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Medical History",
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
      body: SingleChildScrollView(
        child: Column(
          children: cards.map((receipt) {
            return receiptCard(
                receipt:receipt,
                delete: (){
                  setState(() {
                    cards.remove(receipt);
                  });
                },
              buildcontext: context
            );
          }).toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHistory()),
          );
        } ,
        child: Text("Add"),
        backgroundColor: Colors.lightBlueAccent[600],
      ),
    );
  }
}

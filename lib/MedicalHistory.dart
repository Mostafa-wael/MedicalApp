import 'package:flutter/material.dart';
import 'Receipt.dart';
import 'ReceiptCard.dart';

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
                }
            );
          }).toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {} ,
        child: Text("Add"),
        backgroundColor: Colors.lightBlueAccent[600],
      ),
    );
  }
}

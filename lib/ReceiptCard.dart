import 'package:flutter/material.dart';
import 'Receipt.dart';
Card receiptCard({receipt , delete}) {
  return Card(
    margin: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
    child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row (
        children: <Widget>[
          Icon(
            Icons.access_alarm,
            color: Colors.lightBlueAccent,
          ),
          SizedBox(width: 20.0),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.end ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  receipt.name,
                ),
                SizedBox(height: 1.0),
                Text("${receipt.date.year.toString()}-${receipt.date.month.toString()}-${receipt.date.day.toString()}")
              ],
            ),
          ),
          SizedBox(width: 160.0),
          IconButton(

              icon: Icon(Icons.delete),
              onPressed: delete
              )
        ],
      ),
    ),
  );
}

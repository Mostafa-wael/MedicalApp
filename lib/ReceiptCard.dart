import 'package:flutter/material.dart';
import 'Receipt.dart';
GestureDetector receiptCard({receipt , delete, buildcontext}) {
  return GestureDetector(
    onTap: (){
      showAlertDialog(buildcontext);
    },
    child: Card(
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
    ),
  );
}


showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Details"),
    content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
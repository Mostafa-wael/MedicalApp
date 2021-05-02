import 'package:firebase_auth/firebase_auth.dart';
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

var messagesList;

  @override
  Widget build(BuildContext context) {
    String Uid = Provider.of<User>(context).uid;
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:FirebaseFirestore.instance
                  .collection("patient")
                  .doc(Uid)
                  .collection("MedicalHistory")
                  .snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot)
              {
                if(!snapshot.hasData || snapshot.data.size==0)
                {

                  return Center(
                    child: Text("No History Yet"),
                  );
                }
                else
                {
                  messagesList = snapshot.data.docs;
                  return ListView.builder(
                    itemBuilder: (context,index)
                    {
                      return ListTile(
                        title: Text(snapshot.data.docs[index]["Title"]),
                        subtitle:Column(
                          children: [
                            Text(snapshot.data.docs[index]["description"]),
                            Text(snapshot.data.docs[index]["Date"]),
                          ],
                        ) ,
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  );
                }
              },
            ),
          ),
        ],
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

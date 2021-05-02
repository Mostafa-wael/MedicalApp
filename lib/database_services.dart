
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String userID;

  DatabaseService({this.userID});

  final CollectionReference patientCollection = FirebaseFirestore.instance.collection('patient');

  // Function to insert patient data into Firebase
  Future addUserData(String first, String last, int phone, String email) async
  {
    return await patientCollection.doc(userID).set({
      "first_name": first,
      "last_name": last,
      "phone_num": phone,
      "email": email,
    });
  }


}
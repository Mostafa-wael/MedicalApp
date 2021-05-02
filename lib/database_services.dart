
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';

class DatabaseService{


  final CollectionReference patientCollection = FirebaseFirestore.instance.collection('patient');

  // Function to insert patient data into Firebase
  Future addUserData(String userID,String first, String last, int phone, String email, int age, String gender) async
  {
    try {
      return await patientCollection.doc(userID).set({
        "first_name": first,
        "last_name": last,
        "phone_num": phone,
        "email": email,
        "age": age,
        "gender": gender,
      });

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }


  }

  Future<DocumentSnapshot> getUserData(String userID)async
  {
    var docRef = patientCollection.doc(userID);

   var doc = await docRef.get();
   /*
    await docRef.get().then((doc) => (){
      print(doc);
      if(doc.exists) result = doc; else result = null;
      print(doc.data()['first_name']);
    }).catchError((error) => () {
      print(error.toString());
      result = null;
    }


    );
    */
    return doc;
  }

  // Function used to add a user medical record
  Future addMedicalRecord(String userID, String title, String description, List<String> media)
  async{
    try{
      return await patientCollection.doc(userID).collection('Medical History').add({
        "title":title,
        "description": description,
        "media": media,
      });
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  // Function that gets medical records of specific user
  Future<QuerySnapshot> getMedicalRecords(String userID) async
  {
    var cRef = patientCollection.doc(userID).collection('Medical History');
    dynamic result;
    await cRef.get().then((collection) => (){
      result = collection;
    }).catchError((onError) =>(){
      print(onError.toString());
      result = null;
    });
    return result;
  }

}
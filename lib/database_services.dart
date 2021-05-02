
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String userID;

  DatabaseService({this.userID});

  final CollectionReference patientCollection = FirebaseFirestore.instance.collection('patient');

  // Function to insert patient data into Firebase
  Future addUserData(String first, String last, int phone, String email, int age, String gender) async
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

  Future addMedicalRecord(String title, String description, List<String> media)
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

    }
  }

}
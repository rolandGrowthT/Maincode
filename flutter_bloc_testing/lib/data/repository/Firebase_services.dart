import 'package:cloud_firestore/cloud_firestore.dart';
  Future<void> initializeFirestoreCollection() async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('users_collection');
      QuerySnapshot snapshot = await collectionReference.limit(1).get();
      if (snapshot.size != 0) {
        print('Firestore collection already exists.');
      }
    } catch (e) {
      print('Error initializing Firestore collection: $e');
    }
  }
  Future<void> insertuser(String id, String fname, String lname) async{
        try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('users_collection');
        Map<String,dynamic> UserData = {
          'id': id,
          'firstName':fname,
          'lastName':lname,
        };
        await collectionReference.doc(id).set(UserData);
        print('user inserted succesfully');
        }catch(e){print('Error inserting user');}
  }
  

import 'package:cloud_firestore/cloud_firestore.dart';

class UploadSMS {
  final String dustbinNumber;
  final String mobileNo;
  final String dateTime;
  final String message;

  UploadSMS(
    this.dustbinNumber,
    this.mobileNo,
    this.dateTime,
    this.message,
    uploadSMS(dustbinNumber,mobileNo,dateTime,message),
  );
  CollectionReference inbox =
      FirebaseFirestore.instance.collection('ecoharbar_Inbox');

  Future<void> uploadSMS(String dustbinNumber, String mobileNo, String dateTime, String message) {
    return inbox
        .add({
          'id': dustbinNumber,
          'message': message,
          'mobileNO': mobileNo,
          'dateTime': dateTime,
        })
        .then((value) => print("Data Added"))
        .catchError((error) => print("Failed to add Data: $error"));
  }
}

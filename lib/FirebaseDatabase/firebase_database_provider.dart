import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseOperation{
  String? seriesName;
  String? studentName;
  String? studentDept;
  String? studentBatch;
  String? studentNumber;

  FirebaseDatabaseOperation({
    this.seriesName,
    this.studentName,
    this.studentDept,
    this.studentBatch,
    this.studentNumber,
  });

  // Add data in database
  void addData() async {
    FirebaseFirestore firebaseFirestore = await FirebaseFirestore.instance;
    //
    Map<String, dynamic> studentMap = {
      "name": studentName,
      "dept": studentDept,
      "batch": studentBatch,
      "number": studentNumber,
    };

    firebaseFirestore
        .collection("Member of PADMA")
        .doc(seriesName)
        .collection(studentName!)
        .doc("Student Details")
        .set(studentMap);

    log("Data saved!!");
  }
}

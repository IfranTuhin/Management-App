import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app/Model/user_model.dart';

class FirebaseDatabaseOperation {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Add data in database
  addData(String seriesName, String studentName, String studentDept,
      String studentBatch, String studentNumber) async {
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
        .collection(studentName)
        .doc("Student Details")
        .set(studentMap);
  }
  // Get data from firestore

  void loadData(String seriesName, String studentName, String studentDept,
      String studentBatch, String studentNumber) async{

    var result = await firebaseFirestore.collection("Member of PADMA")
        .doc(seriesName)
        .collection(studentName)
        .doc("Student Details")
        .get();

    UserModel userModel = UserModel.fromJson(result.data()!);

    print(result.data());

  }

}

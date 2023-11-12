import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? seriesName;
  String? studentName;
  String? studentDept;
  String? studentBatch;
  String? studentNumber;

  UserModel(
    this.seriesName,
    this.studentName,
    this.studentDept,
    this.studentBatch,
    this.studentNumber,
  );


  UserModel.fromJson(Map map){
    seriesName = map["seriesName"];
    studentName = map["studentName"];
    studentDept = map["studentDept"];
    studentBatch = map["studentBatch"];
    studentNumber = map["studentNumber"];
  }

  Map toJson() {
    Map map = {
      "seriesName" : seriesName,
      "studentName" : studentName,
      "studentDept" : studentDept,
      "studentBatch" : studentBatch,
      "studentNumber" : studentNumber,
    };
    return map;
  }

}

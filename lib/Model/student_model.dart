import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String? id;
  String? studentName;
  String? studentDept;
  String? studentBatch;
  String? studentNumber;

  StudentModel({
    this.id,
    this.studentName,
    this.studentDept,
    this.studentBatch,
    this.studentNumber,
  });

  StudentModel.fromJson(Map map) {
    id = map["id"];
    studentName = map["studentName"];
    studentDept = map["studentDept"];
    studentBatch = map["studentBatch"];
    studentNumber = map["studentNumber"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "studentName": studentName,
      "studentDept": studentDept,
      "studentBatch": studentBatch,
      "studentNumber": studentNumber,
    };
    return map;
  }
}

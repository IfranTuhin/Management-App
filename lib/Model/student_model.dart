
class StudentModel {
  String? id;
  String? studentName;
  String? studentDept;
  String? studentBatch;
  String? studentNumber;
  String? imageUrl;

  StudentModel({
    this.id,
    this.studentName,
    this.studentDept,
    this.studentBatch,
    this.studentNumber,
    this.imageUrl,
  });

  StudentModel.fromJson(Map map) {
    id = map["id"];
    studentName = map["studentName"];
    studentDept = map["studentDept"];
    studentBatch = map["studentBatch"];
    studentNumber = map["studentNumber"];
    imageUrl = map["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "studentName": studentName,
      "studentDept": studentDept,
      "studentBatch": studentBatch,
      "studentNumber": studentNumber,
      "imageUrl": imageUrl,
    };
    return map;
  }

  Map<String, dynamic> toImage() {
    Map<String, dynamic> map = {
      "imageUrl": imageUrl,
    };
    return map;
  }
}

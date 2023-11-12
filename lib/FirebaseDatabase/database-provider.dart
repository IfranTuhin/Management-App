import 'package:flutter/cupertino.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';

class DatabaseProvider with ChangeNotifier{

  bool isLoading = false;

  FirebaseDatabaseOperation firebaseDatabaseOperation = FirebaseDatabaseOperation();

  void addData(String seriesName, String studentName, String studentDept, String studentBatch, String studentNumber){

    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.addData(seriesName, studentName, studentDept, studentBatch, studentNumber);


  }

}
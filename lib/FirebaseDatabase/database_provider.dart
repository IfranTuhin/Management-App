import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/chandradip_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider with ChangeNotifier {
  bool isLoading = false;

  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  // ----------------------------------------------------------------
  // TODO: Firebase Sign up
  void createUser(String name, String email, String password, Function callback){
    isLoading = true;
    notifyListeners();

    firebaseDatabaseOperation.createUser(name, email, password, (int status){

        isLoading = false;
        notifyListeners();
        if(status == 1){
          callback(1);
        } else{
          callback(0);
        }
    });
  }

  // ----------------------------------------------------------------
  // TODO: Firebase Login
   login(String email, String password, Function callback, BuildContext context){
    isLoading = true;
    notifyListeners();

    firebaseDatabaseOperation.login(email, password, (int status){

      isLoading = false;
      notifyListeners();
      if(status == 1){
        callback(1);
      } else{
        callback(0);
      }
    }, context);
  }

  // ----------------------------------------------------------------
  // TODO: Check Firebase Login
  bool userLogin = true;
  Future<bool> isLogin() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if(sharedPref.containsKey(AppConstraints.userId) && sharedPref.getString(AppConstraints.userId)!.isNotEmpty){
      userLogin = true;
      return Future.value(true);
    }else{
      userLogin = false;
      return Future.value(false);
    }

  }

  // TODO:  Firebase Logout
  Future<bool> logout() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(AppConstraints.userId);
    sharedPref.remove(AppConstraints.userName);
    sharedPref.remove(AppConstraints.userEmail);
    sharedPref.remove(AppConstraints.userPassword);
    return Future.value(true);

  }

  // ----------------------------------------------------------------
  // TODO: Member of PADMA series list data
  List<String> seriesLists = ['1', '2', '3', '4', '5', '6', '7', '8',
    '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32',
    '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43',
    '44', '45', '46', '47', '48', '49','50'];

  String selectSeries = '1';

  changeSeries(String value) {
    selectSeries = value;
    notifyListeners();
  }

  // ----------------------------------------------------------------
  // TODO: Member of PADMA pic image from gallery
  File? profilePic;
  String imageUrl = '';

  pickImage() async {
    imageUrl = '';

    final XFile? selectedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if(selectedImage != null) {
      profilePic =  File(selectedImage.path);

       firebaseDatabaseOperation.uploadImage(profilePic!).then((value) {
         imageUrl = value;
         notifyListeners();
       });
    }
    notifyListeners();
  }

  // ----------------------------------------------------------------

  // TODO: Member of PADMA add student data

  addStudentData(StudentModel studentModel, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation
        .addStudentData(studentModel, int.parse(selectSeries), (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

  // ----------------------------------------------------------------

  // TODO: Member of PADMA add student image update
  updateImage(String seriesName, String id) async {
    imageUrl = '';

    final XFile? selectedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if(selectedImage != null) {
      profilePic =  File(selectedImage.path);

      firebaseDatabaseOperation.uploadImage(profilePic!).then((value) {
        imageUrl = value;
        notifyListeners();

        StudentModel studentModel = StudentModel(id: id, imageUrl: imageUrl);
        firebaseDatabaseOperation.updateStudentImage(studentModel, seriesName, (int value) {
          isLoading = false;
          notifyListeners();
        });
      });
    }
    notifyListeners();
  }

  //----------------------------------------------------------------

  // TODO: Member of PADMA update student data

  updateStudentData(
      StudentModel studentModel, String seriesName, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.updateStudentData(studentModel, seriesName,
        (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

  // ----------------------------------------------------------------

  // TODO: PADMA  Panel session list data

  List<String> sessionList = [
    '2005-2006',
    '2006-2007',
    '2007-2008',
    '2008-2009',
    '2009-2010',
    '2010-2011',
    '2011-2012',
    '2012-2013',
    '2013-2014',
    '2014-2015',
    '2015-2016',
    '2016-2017',
    '2017-2018',
    "2018-2019",
    '2019-2020',
    '2020-2021',
    '2021-2022',
    '2022-2023',
    '2023-2024',
    '2024-2025',
    '2025-2026',
    '2026-2027',
    '2027-2028',
    '2028-2029',
    '2029-2030'
  ];
  String selectSession = '2005-2006';

  changeSession(String value) {
    selectSession = value;
    notifyListeners();
  }

  // ----------------------------------------------------------------

// TODO: add padma panel member data
  addPadmaPanelMemberData(
      PadmaPanelMemberModel padmaPanelMemberModel, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.padmaPanelMemberAddData(
        padmaPanelMemberModel, selectSession, (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

  // ----------------------------------------------------------------

  // TODO: Update padma panel member image

  padmaPanelUpdateImage(String seriesName, String id) async {
    imageUrl = '';

    final XFile? selectedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if(selectedImage != null) {
      profilePic =  File(selectedImage.path);

      firebaseDatabaseOperation.uploadImage(profilePic!).then((value) {
        imageUrl = value;
        notifyListeners();

        PadmaPanelMemberModel padmaPanelMemberModel = PadmaPanelMemberModel(memberId: id, imageUrl: imageUrl);
        firebaseDatabaseOperation.padmaPanelMemberUpdateImage(padmaPanelMemberModel, seriesName, (int value) {
          isLoading = false;
          notifyListeners();
        });
      });
    }
    notifyListeners();
  }

  // ----------------------------------------------------------------

  // TODO: Update padma panel member data
  updatePadmaPanelData(PadmaPanelMemberModel padmaPanelMemberModel,
      String sessionName, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.padmaPanelMemberUpdateData(
        padmaPanelMemberModel, sessionName, (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

  // ----------------------------------------------------------------

  // TODO: Coaching  Panel session list data
  List<String> coachingSessionList = [
    '2010-2011',
    '2011-2012',
    '2012-2013',
    '2013-2014',
    '2014-2015',
    '2015-2016',
    '2016-2017',
    '2017-2018',
    "2018-2019",
    '2019-2020',
    '2020-2021',
    '2021-2022',
    '2022-2023',
    '2023-2024',
    '2024-2025',
    '2025-2026',
    '2026-2027',
    '2027-2028',
    '2028-2029',
    '2029-2030'
  ];
  String coachingSelectSession = '2010-2011';

  coachingChangeSession(String value) {
    coachingSelectSession = value;
    notifyListeners();
  }

  // ----------------------------------------------------------------

  // TODO: add Coaching panel member data
  addCoachingPanelMemberData(
      CoachingPanelModel coachingPanelModel, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.coachingPanelMemberAddData(
        coachingPanelModel, coachingSelectSession, (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

  // ----------------------------------------------------------------

  // TODO: Update padma panel member image

  updateCoachingPanelMemberImage(String seriesName, String id) async {
    imageUrl = '';

    final XFile? selectedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if(selectedImage != null) {
      profilePic =  File(selectedImage.path);

      firebaseDatabaseOperation.uploadImage(profilePic!).then((value) {
        imageUrl = value;
        notifyListeners();

        CoachingPanelModel coachingPanelModel = CoachingPanelModel(memberId: id, imageUrl: imageUrl);
        firebaseDatabaseOperation.coachingPanelMemberImageUpdate(coachingPanelModel, seriesName, (int value) {
          isLoading = false;
          notifyListeners();
        });
      });
    }
    notifyListeners();
  }

  // ----------------------------------------------------------------

  // TODO: Coaching panel member data Update
  updateCoachingPanelMemberData(
      CoachingPanelModel coachingPanelModel, sessionName, Function callback) {
    isLoading = true;
    notifyListeners();
    firebaseDatabaseOperation.coachingPanelMemberAddData(
        coachingPanelModel, sessionName, (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }

// ----------------------------------------------------------------

}

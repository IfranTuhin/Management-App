import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/padma_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_message.dart';

class DatabaseProvider with ChangeNotifier {
  bool isLoading = false;

  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

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

  //

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

  // TODO: add Coaching panel member data Update
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

  //
  //
  // File? selectedImage;
  // String imageUrl = '';
  //
  // void pickImage() async {
  //   imageUrl = '';
  //   final ImagePicker picker = ImagePicker();
  //
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImage = File(image.path);
  //
  //     selectedImage.uploadImage(selectedImage!).then((value) {
  //       imageUrl = value;
  //       notifyListeners();
  //     });
  //   }
  //   notifyListeners();
  // }
}

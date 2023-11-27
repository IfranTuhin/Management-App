import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/padma_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_data_input.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:uuid/uuid.dart';

class FirebaseDatabaseOperation {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  // TODO: Member of padma Upload image in storage
  Future<String> uploadImage (File file) async{

    final firebaseFirestore = FirebaseStorage.instance;

     UploadTask uploadTask =  firebaseFirestore.ref().child('images/').child(Uuid().v1()).child('').putFile(file);
     TaskSnapshot taskSnapshot = await uploadTask;
     String donwloadUrl = await taskSnapshot.ref.getDownloadURL();
     return donwloadUrl;
  }

  // TODO: Member of padma Delete image from storage
  // Future<void> deleteImage(String imagePath) async {
  //   try {
  //     final FirebaseStorage _storage = FirebaseStorage.instance;
  //     Reference storageRef = _storage.ref().child(imagePath);
  //
  //     // Delete the file
  //     await storageRef.delete();
  //     print('Image deleted successfully.');
  //   } catch (e) {
  //     print('Error deleting image: $e');
  //   }
  // }

  // TODO: Member of padma Add data in database
  addStudentData(
      StudentModel studentModel, int series, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.memberOfPadma)
        .doc(AppConstraints.docData)
        .collection('$series Series')
        .doc(studentModel.id.toString())
        .set(studentModel.toJson())
        .then((value) {
      //
      firebaseFirestore
          .collection(AppConstraints.seriesName)
          .doc(series.toString())
          .set({'series': '$series Series'}).then((value) {
        callback(1);
      });
    });
  }

  //  TODO: Member of padma update data in database
  updateStudentData(
      StudentModel studentModel, String seriesName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.memberOfPadma)
        .doc(AppConstraints.docData)
        .collection(seriesName)
        .doc(studentModel.id.toString())
        .update(studentModel.toJson())
        .then((value) {
      callback(1);
    });
  }

  // TODO:  Padma Panel data Add in database
  padmaPanelMemberAddData(PadmaPanelMemberModel padmaPanelMemberModel,
      String session, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.padmaPanel)
        .doc(AppConstraints.panelData)
        .collection(session)
        .doc(padmaPanelMemberModel.memberId.toString())
        .set(padmaPanelMemberModel.toJson())
        .then((value) {
      //
      firebaseFirestore
          .collection(AppConstraints.sessionName)
          .doc(session.toString())
          .set({'session': session}).then((value) {
        callback(1);
      });
    });
  }

  //  TODO: Padma Panel update data in database
  padmaPanelMemberUpdateData(
      PadmaPanelMemberModel padmaPanelMemberModel, String sessionName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.padmaPanel)
        .doc(AppConstraints.panelData)
        .collection(sessionName)
        .doc(padmaPanelMemberModel.memberId.toString())
        .update(padmaPanelMemberModel.toJson())
        .then((value) {
      callback(1);
    });
  }

  // TODO:  Coaching Panel data Add in database
  coachingPanelMemberAddData(CoachingPanelModel coachingPanelModel,
      String session, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.coachingPanel)
        .doc(AppConstraints.coachingData)
        .collection(session)
        .doc(coachingPanelModel.memberId.toString())
        .set(coachingPanelModel.toJson())
        .then((value) {
      //
      firebaseFirestore
          .collection(AppConstraints.coachingSession)
          .doc(session.toString())
          .set({'session': session}).then((value) {
        callback(1);
      });
    });
  }

  // TODO:  Coaching Panel data Add in database
  coachingPanelMemberDataUpdate(CoachingPanelModel coachingPanelModel,
      String sessionName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.coachingPanel)
        .doc(AppConstraints.coachingData)
        .collection(sessionName)
        .doc(coachingPanelModel.memberId.toString())
        .update(coachingPanelModel.toJson())
        .then((value) {
      callback(1);
    });
  }

}

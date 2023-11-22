import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/padma_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/utils/app_constraints.dart';

class FirebaseDatabaseOperation {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
      StudentModel studentModel, int series, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.memberOfPadma)
        .doc(AppConstraints.docData)
        .collection('$series Series')
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
      PadmaPanelMemberModel padmaPanelMemberModel, String session, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.padmaPanel)
        .doc(AppConstraints.panelData)
        .collection(session)
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

  //  TODO: Member of padma update data in database
  // Future<void> deleteData()
}

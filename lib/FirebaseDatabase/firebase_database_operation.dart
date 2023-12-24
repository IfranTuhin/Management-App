import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/login_model.dart';
import 'package:management_app/Model/chandradip_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FirebaseDatabaseOperation {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // ----------------------------------------------------------------
  // TODO: Firebase SignUp
  createUser(String name, String email, String password,Function callBack)async{

    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      LoginModel loginModel = LoginModel(value.user!.uid, name, email, password);

      firebaseFirestore.collection(AppConstraints.signUpData).doc(value.user!.uid).set(loginModel.toJson()).then((value) {
        callBack(1);
      });

    });

  }

  // ----------------------------------------------------------------
  // TODO: Firebase Login
  login(String email, String password, Function callback, BuildContext context)async{

    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) async {

      var result = await firebaseFirestore.collection(AppConstraints.signUpData).doc(value.user!.uid).get();
      LoginModel loginModel = LoginModel.fromJson(result.data()!);

      final SharedPreferences sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString(AppConstraints.userId, value.user!.uid);
      sharedPref.setString(AppConstraints.userName, loginModel.name!);
      sharedPref.setString(AppConstraints.userEmail, loginModel.email!);
      sharedPref.setString(AppConstraints.userPassword, loginModel.password!);

      callback(1);

     }).catchError((e){
      if (e.toString().startsWith('[firebase_auth/user-not-found]')) {
        showSnackBarMessage(context,e.toString().replaceAll("[firebase_auth/user-not-found]",""));
      } else if (e.toString().startsWith('[firebase_auth/wrong-password]')) {
        showSnackBarMessage(context,e.toString().replaceAll("[firebase_auth/wrong-password]",""));
      }

      callback(0);
    });

  }

  //----------------------------------------------------------------
  // TODO:Upload image in Firebase Storage
  Future<String> uploadImage (File file) async{

    final firebaseFirestore = FirebaseStorage.instance;

     UploadTask uploadTask =  firebaseFirestore.ref().child('images/').child(Uuid().v1()).child('').putFile(file);
     TaskSnapshot taskSnapshot = await uploadTask;
     String donwloadUrl = await taskSnapshot.ref.getDownloadURL();
     return donwloadUrl;
  }
  //----------------------------------------------------------------

  // TODO: Delete image from Firebase Storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      Reference imageRef = storage.refFromURL(imageUrl);
      await imageRef.delete();
      print('Image deleted successfully');
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  // ----------------------------------------------------------------
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

  // ----------------------------------------------------------------

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

  // TODO -------------------- member of padma update image------------------------
  updateStudentImage(
      StudentModel studentModel, String seriesName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.memberOfPadma)
        .doc(AppConstraints.docData)
        .collection(seriesName)
        .doc(studentModel.id.toString())
        .update(studentModel.toImage())
        .then((value) {
      callback(1);
    });
  }

  // ----------------------------------------------------------------

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

  // ----------------------------------------------------------------

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

  // ----------------------------------------------------------------

  //  TODO: Padma Panel update image in storage
  padmaPanelMemberUpdateImage(
      PadmaPanelMemberModel padmaPanelMemberModel, String sessionName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.padmaPanel)
        .doc(AppConstraints.panelData)
        .collection(sessionName)
        .doc(padmaPanelMemberModel.memberId.toString())
        .update(padmaPanelMemberModel.toImage())
        .then((value) {
      callback(1);
    });
  }

  // ----------------------------------------------------------------

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

  // ----------------------------------------------------------------

  // TODO:  Coaching Panel data Update in database
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

// ----------------------------------------------------------------

// TODO:  Coaching Panel data Update in database
  coachingPanelMemberImageUpdate(CoachingPanelModel coachingPanelModel,
      String sessionName, Function callback) async {
    firebaseFirestore
        .collection(AppConstraints.coachingPanel)
        .doc(AppConstraints.coachingData)
        .collection(sessionName)
        .doc(coachingPanelModel.memberId.toString())
        .update(coachingPanelModel.toImage())
        .then((value) {
      callback(1);
    });
  }

// ----------------------------------------------------------------

}

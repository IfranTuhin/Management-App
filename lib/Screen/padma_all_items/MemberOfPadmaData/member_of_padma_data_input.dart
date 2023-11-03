import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_provider.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:provider/provider.dart';

class MemberOfPadmaDataInput extends StatefulWidget {
  const MemberOfPadmaDataInput({Key? key}) : super(key: key);

  @override
  State<MemberOfPadmaDataInput> createState() => _MemberOfPadmaDataInputState();
}

class _MemberOfPadmaDataInputState extends State<MemberOfPadmaDataInput> {
  // all text editing controller
  TextEditingController seriesNameController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentDeptController = TextEditingController();
  TextEditingController studentBatchController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add data In Firebase",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputTextField(
                textEditingController: seriesNameController,
                hintText: "Series Name",
              ),
              InputTextField(
                textEditingController: studentNameController,
                hintText: "Student Name",
              ),
              InputTextField(
                textEditingController: studentDeptController,
                hintText: "Student Dept",
              ),
              InputTextField(
                textEditingController: studentBatchController,
                hintText: "Student Batch",
              ),
              InputTextField(
                textEditingController: studentNumberController,
                hintText: "Student Number",
              ),

              const SizedBox(height: 60),
              //Save button
              InkWell(
                onTap: () async {
                  String seriesName = seriesNameController.text;
                  String studentName = studentNameController.text;
                  String studentDept = studentDeptController.text;
                  String studentBatch = studentBatchController.text;
                  String studentNumber = studentNumberController.text;
                  //
                  if(seriesName != "" && studentName != "" && studentDept != "" && studentBatch != "" && studentNumber != ""){
                    Map<String, dynamic> studentMap = {
                      "name": studentName,
                      "dept": studentDept,
                      "batch": studentBatch,
                      "number": studentNumber,
                    };
                    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                    firebaseFirestore
                        .collection("Member of PADMA")
                        .doc(seriesName)
                        .collection(studentName)
                        .doc("Student Details")
                        .set(studentMap);
                    log('User data added!');
                  }
                  else{
                    log("Fill all field");
                  }

                },
                child: CustomButton(buttonText: "Save Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class MemberOfChandradipDataInput extends StatefulWidget {

   const MemberOfChandradipDataInput({Key? key,}) : super(key: key);

  @override
  State<MemberOfChandradipDataInput> createState() => _MemberOfChandradipDataInputState();
}

class _MemberOfChandradipDataInputState extends State<MemberOfChandradipDataInput> {
  // all text editing controller
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentDeptController = TextEditingController();
  TextEditingController studentBatchController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  // ToDo: Profile Picture


  //
  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringUtils.addDataInFirebase,
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
                const SizedBox(height: 10,),
                // ToDo: Pic image from gallery
                CupertinoButton(
                  onPressed: () async {
                    databaseProvider.pickImage();
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: (databaseProvider.profilePic != null) ? FileImage(databaseProvider.profilePic!) : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Expanded(child: Text(StringUtils.selectSeries,style: TextStyle(fontSize: 16),)),
                      Expanded(
                        child: DropdownButton(
                          value: databaseProvider.selectSeries,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: databaseProvider.seriesLists.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            databaseProvider.changeSeries(newValue!);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                InputTextField(
                  textEditingController: studentIdController,
                  hintText: StringUtils.studentId,
                  textInputType: TextInputType.number,
                ),
                InputTextField(
                  textEditingController: studentNameController,
                  hintText: StringUtils.studentName,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: studentDeptController,
                  hintText: StringUtils.studentDept,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: studentBatchController,
                  hintText: StringUtils.studentBatch,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: studentNumberController,
                  hintText: StringUtils.studentNumber,
                  textInputType: TextInputType.number,
                ),

                const SizedBox(height: 60),
                //Save button
                databaseProvider.isLoading ? const Center(child: CircularProgressIndicator(),) : InkWell(
                  onTap: () async {
                    String studentId = studentIdController.text;
                    String studentName = studentNameController.text;
                    String studentDept = studentDeptController.text;
                    String studentBatch = studentBatchController.text;
                    String studentNumber = studentNumberController.text;

                    StudentModel studentModel = StudentModel(
                      id: studentId,
                      studentName: studentName,
                      studentDept: studentDept,
                      studentBatch: studentBatch,
                      studentNumber: studentNumber,
                      imageUrl: databaseProvider.imageUrl,
                    );

                    databaseProvider.addStudentData(studentModel, (int value){
                      if(value == 1){
                        showSnackBarMessage(context, StringUtils.dataSuccessfullyAdded,isError: false);
                        Navigator.of(context).pop();
                      }
                      else{
                        showSnackBarMessage(context, StringUtils.failedAddData);
                      }
                    });

                    setState(() {
                      databaseProvider.profilePic = null;
                    });


                  },
                  child: CustomButton(buttonText: StringUtils.saveData),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

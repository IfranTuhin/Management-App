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

class MemberOfChandradipDataUpdate extends StatefulWidget {
  StudentModel studentModel;
  String? seriesName;

  MemberOfChandradipDataUpdate(
      {Key? key, required this.studentModel, this.seriesName})
      : super(key: key);

  @override
  State<MemberOfChandradipDataUpdate> createState() =>
      _MemberOfChandradipDataUpdateState();
}

class _MemberOfChandradipDataUpdateState extends State<MemberOfChandradipDataUpdate> {
  @override
  void initState() {
    studentIdController.text = widget.studentModel.id!;
    studentNameController.text = widget.studentModel.studentName!;
    studentDeptController.text = widget.studentModel.studentDept!;
    studentBatchController.text = widget.studentModel.studentBatch!;
    studentNumberController.text = widget.studentModel.studentNumber!;
    super.initState();
  }

  // all text editing controller
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentDeptController = TextEditingController();
  TextEditingController studentBatchController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  //
  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringUtils.updateDataInFirebase,
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
                const SizedBox(height: 10),
                // ToDo: Pic image from gallery
                CupertinoButton(
                  onPressed: () async {
                    databaseProvider.updateImage(
                        widget.seriesName!, widget.studentModel.id!);
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: (databaseProvider.profilePic == null)
                        ? NetworkImage(widget.studentModel.imageUrl!)
                        : FileImage(databaseProvider.profilePic!)
                            as ImageProvider,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        StringUtils.selectedSeries,
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        widget.seriesName!,
                        style: TextStyle(fontSize: 18),
                      )),
                    ],
                  ),
                ),

                InputTextField(
                  textEditingController: studentIdController,
                  hintText: StringUtils.studentId,
                  textInputType: TextInputType.number,
                  enabled: false,
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
                databaseProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : InkWell(
                        onTap: () async {

                          if (widget.studentModel.imageUrl!.isNotEmpty) {
                            firebaseDatabaseOperation
                                .deleteImage(widget.studentModel.imageUrl!);
                          }

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
                            // imageUrl: ,
                          );

                          databaseProvider.updateStudentData(
                              studentModel, widget.seriesName!, (int value) {
                            if (value == 1) {
                              showSnackBarMessage(
                                  context, StringUtils.dataSuccessfullyAdded,
                                  isError: false);
                              Navigator.of(context).pop();
                            } else {
                              showSnackBarMessage(
                                  context, StringUtils.failedAddData);
                            }
                          });
                        },
                        child: CustomButton(buttonText: StringUtils.updateData),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

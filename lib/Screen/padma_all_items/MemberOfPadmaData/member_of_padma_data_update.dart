
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class MemberOfPadmaDataUpdate extends StatefulWidget {

  StudentModel studentModel;

  MemberOfPadmaDataUpdate({Key? key, required this.studentModel}) : super(key: key);


  @override
  State<MemberOfPadmaDataUpdate> createState() => _MemberOfPadmaDataUpdateState();
}

class _MemberOfPadmaDataUpdateState extends State<MemberOfPadmaDataUpdate> {

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
                    );

                    databaseProvider.updateStudentData(studentModel, (int value){
                      if(value == 1){

                          showSnackBarMessage(context, StringUtils.dataSuccessfullyAdded,isError: false);
                          Navigator.of(context).pop();

                      }
                      else{
                        showSnackBarMessage(context, StringUtils.failedAddData);
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

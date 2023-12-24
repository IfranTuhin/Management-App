
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Model/chandradip_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class CoachingPanelDataUpdate extends StatefulWidget {

  CoachingPanelModel coachingPanelModel;
  final String ? sessionName;

  CoachingPanelDataUpdate({Key? key, required this.coachingPanelModel, this.sessionName}) : super(key: key);


  @override
  State<CoachingPanelDataUpdate> createState() => _CoachingPanelDataUpdateState();
}

class _CoachingPanelDataUpdateState extends State<CoachingPanelDataUpdate> {

  @override
  void initState() {
    memberIdController.text = widget.coachingPanelModel.memberId!;
    memberNameController.text = widget.coachingPanelModel.memberName!;
    memberDeptController.text = widget.coachingPanelModel.memberDept!;
    memberPositionController.text = widget.coachingPanelModel.memberPosition!;
    memberNumberController.text = widget.coachingPanelModel.memberNumber!;
    super.initState();
  }

  // all text editing controller
  TextEditingController memberIdController = TextEditingController();
  TextEditingController memberNameController = TextEditingController();
  TextEditingController memberDeptController = TextEditingController();
  TextEditingController memberPositionController = TextEditingController();
  TextEditingController memberNumberController = TextEditingController();

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
                    databaseProvider.updateCoachingPanelMemberImage(
                        widget.sessionName!, widget.coachingPanelModel.memberId!);
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: (databaseProvider.profilePic == null)
                        ? NetworkImage(widget.coachingPanelModel.imageUrl!)
                        : FileImage(databaseProvider.profilePic!)
                    as ImageProvider,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Expanded(child: Text(StringUtils.selectSession,style: TextStyle(fontSize: 16),)),
                      Expanded(child: Text(widget.sessionName!,style: TextStyle(fontSize: 16),)),
                    ],
                  ),
                ),

                InputTextField(
                  textEditingController: memberIdController,
                  hintText: StringUtils.memberId,
                  textInputType: TextInputType.number,
                  enabled: false,
                ),
                InputTextField(
                  textEditingController: memberNameController,
                  hintText: StringUtils.memberName,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: memberDeptController,
                  hintText: StringUtils.memberDept,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: memberPositionController,
                  hintText: StringUtils.memberPosition,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: memberNumberController,
                  hintText: StringUtils.memberNumber,
                  textInputType: TextInputType.number,
                ),

                const SizedBox(height: 60),
                //Save button
                databaseProvider.isLoading ? const Center(child: CircularProgressIndicator(),) : InkWell(
                  onTap: () async {

                    if (widget.coachingPanelModel.imageUrl!.isNotEmpty) {
                      firebaseDatabaseOperation
                          .deleteImage(widget.coachingPanelModel.imageUrl!);
                    }

                    String memberId = memberIdController.text;
                    String memberName = memberNameController.text;
                    String memberDept = memberDeptController.text;
                    String memberPosition = memberPositionController.text;
                    String memberNumber = memberNumberController.text;

                    CoachingPanelModel coachingPanelModel = CoachingPanelModel(
                      memberId: memberId,
                      memberName: memberName,
                      memberDept: memberDept,
                      memberPosition: memberPosition,
                      memberNumber: memberNumber,
                      imageUrl: databaseProvider.imageUrl,
                    );

                    databaseProvider.updateCoachingPanelMemberData(coachingPanelModel, widget.sessionName!, (int value){
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

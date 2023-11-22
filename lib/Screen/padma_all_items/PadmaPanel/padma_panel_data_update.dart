
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/padma_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class PadmaPanelDataUpdate extends StatefulWidget {

  PadmaPanelMemberModel padmaPanelMemberModel;

  PadmaPanelDataUpdate({Key? key, required this.padmaPanelMemberModel}) : super(key: key);


  @override
  State<PadmaPanelDataUpdate> createState() => _PadmaPanelDataUpdateState();
}

class _PadmaPanelDataUpdateState extends State<PadmaPanelDataUpdate> {

  @override
  void initState() {
    memberIdController.text = widget.padmaPanelMemberModel.memberId!;
    memberNameController.text = widget.padmaPanelMemberModel.memberName!;
    memberDeptController.text = widget.padmaPanelMemberModel.memberDept!;
    memberPositionController.text = widget.padmaPanelMemberModel.memberPosition!;
    memberNumberController.text = widget.padmaPanelMemberModel.memberNumber!;
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Expanded(child: Text(StringUtils.selectSession,style: TextStyle(fontSize: 16),)),
                      Expanded(
                        child: DropdownButton(
                          value: databaseProvider.selectSession,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: databaseProvider.sessionList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            databaseProvider.changeSession(newValue!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                InputTextField(
                  textEditingController: memberIdController,
                  hintText: StringUtils.memberId,
                  textInputType: TextInputType.number,
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
                    String memberId = memberIdController.text;
                    String memberName = memberNameController.text;
                    String memberDept = memberDeptController.text;
                    String memberPosition = memberPositionController.text;
                    String memberNumber = memberNumberController.text;

                    PadmaPanelMemberModel padmaPanelMemberModel = PadmaPanelMemberModel(
                      memberId: memberId,
                      memberName: memberName,
                      memberDept: memberDept,
                      memberPosition: memberPosition,
                      memberNumber: memberNumber,
                    );

                    databaseProvider.updatePadmaPanelData(padmaPanelMemberModel, (int value){
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

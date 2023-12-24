import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/chandradip_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class ChandradipPanelDataInput extends StatefulWidget {
  const ChandradipPanelDataInput({Key? key}) : super(key: key);

  @override
  State<ChandradipPanelDataInput> createState() => _ChandradipPanelDataInputState();
}

class _ChandradipPanelDataInputState extends State<ChandradipPanelDataInput> {
  // all text editing controller
  TextEditingController memberIdController = TextEditingController();
  TextEditingController memberNameController = TextEditingController();
  TextEditingController memberPositionController = TextEditingController();
  TextEditingController memberDeptController = TextEditingController();
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
            StringUtils.chandradipPanelAddData,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
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
                  textEditingController: memberPositionController,
                  hintText: StringUtils.memberPosition,
                  textInputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: memberDeptController,
                  hintText: StringUtils.memberDept,
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

                    PadmaPanelMemberModel padmaPanelMemberModel = PadmaPanelMemberModel(
                      memberId: memberIdController.text,
                      memberName: memberNameController.text,
                      memberPosition: memberPositionController.text,
                      memberDept: memberDeptController.text,
                      memberNumber: memberNumberController.text,
                      imageUrl: databaseProvider.imageUrl,
                    );

                    databaseProvider.addPadmaPanelMemberData(padmaPanelMemberModel, (int value){
                      if(value == 1){
                        showSnackBarMessage(context, StringUtils.dataSuccessfullyAdded, isError: false);
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

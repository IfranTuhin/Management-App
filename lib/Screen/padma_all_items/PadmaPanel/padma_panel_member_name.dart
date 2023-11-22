import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/padma_panel_member_model.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/student_details_screen.dart';
import 'package:management_app/Screen/padma_all_items/PadmaPanel/padma_panel_data_update.dart';
import 'package:management_app/Screen/padma_all_items/PadmaPanel/padma_panel_member_details_screen.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';

class PadmaPanelMemberNameScreen extends StatelessWidget {
  final String? id;

  PadmaPanelMemberNameScreen({Key? key, this.id}) : super(key: key);

  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.padmaPanelMemberName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(AppConstraints.padmaPanel)
                  .doc(AppConstraints.panelData)
                  .collection(id!)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          PadmaPanelMemberModel padmaPanelMemberModel =
                              PadmaPanelMemberModel.fromJson(
                                  (snapshot.data!.docs[index].data() as Map));

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PadmaPanelMemberDetailsScreen(
                                  padmaPanelMemberModel: padmaPanelMemberModel,
                                ),
                              ));
                            },
                            child: Card(
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        FirebaseFirestore.instance
                                            .collection(AppConstraints.padmaPanel)
                                            .doc(AppConstraints.panelData)
                                            .collection("$id")
                                            .doc(data.id)
                                            .delete();
                                      },
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                        builder: (context) =>
                                        PadmaPanelDataUpdate(
                                        padmaPanelMemberModel: padmaPanelMemberModel,
                                        ),
                                        ));
                                      },
                                      backgroundColor: Colors.red,
                                      icon: Icons.edit,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          padmaPanelMemberModel.memberName!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          padmaPanelMemberModel.memberPosition!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text(
                      "No data found",
                      style: TextStyle(color: Colors.red),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

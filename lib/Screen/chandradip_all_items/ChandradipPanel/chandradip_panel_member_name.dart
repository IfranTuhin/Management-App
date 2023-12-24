import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/chandradip_panel_member_model.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipPanel/chandradip_panel_data_update.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipPanel/chandradip_panel_member_details_screen.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class ChandradipPanelMemberNameScreen extends StatelessWidget {
  final String? id;
  final String? sessionName;

  ChandradipPanelMemberNameScreen({Key? key, this.id, this.sessionName}) : super(key: key);

  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) => Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.chandradipPanelMemberName,
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
                                    ChandradipPanelMemberDetailsScreen(
                                  padmaPanelMemberModel: padmaPanelMemberModel,
                                ),
                              ));
                            },
                            child: Card(
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: databaseProvider.userLogin == false ? Container() : const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {

                                        if(databaseProvider.imageUrl.isNotEmpty){
                                          firebaseDatabaseOperation
                                              .deleteImage(padmaPanelMemberModel.imageUrl!);
                                        }
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
                                            ChandradipPanelDataUpdate(
                                        padmaPanelMemberModel: padmaPanelMemberModel,
                                          sessionName: sessionName,
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
        ),
    );
  }
}

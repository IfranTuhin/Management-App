import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/coaching_panel_model.dart';
import 'package:management_app/Screen/padma_all_items/CoachingPanel/coaching_panel_member_details.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';

class CoachingPanelMemberName extends StatelessWidget {
  final String? id;

  CoachingPanelMemberName({Key? key, this.id}) : super(key: key);

  FirebaseDatabaseOperation firebaseDatabaseOperation =
  FirebaseDatabaseOperation();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.coachingPanelMemberName,
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
                  .collection(AppConstraints.coachingPanel)
                  .doc(AppConstraints.coachingData)
                  .collection(id!)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          CoachingPanelModel coachingPanelModel = CoachingPanelModel.fromJson(
                              (snapshot.data!.docs[index].data() as Map));

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CoachingPanelMemberDetails(
                                  coachingPanelModel: coachingPanelModel,
                                ),
                              ));
                            },
                            child: Card(
                              child: Container(
                                height: 60,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        coachingPanelModel.memberName!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        coachingPanelModel.memberPosition!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
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

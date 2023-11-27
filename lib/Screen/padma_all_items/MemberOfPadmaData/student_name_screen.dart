import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_data_input.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_data_update.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/student_details_screen.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';

class StudentNameScreen extends StatelessWidget {
  final int? id;
  String ? seriesName;

  StudentNameScreen({Key? key, this.id, this.seriesName}) : super(key: key);

  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.padmaStudentName,
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
                  .collection(AppConstraints.memberOfPadma)
                  .doc(AppConstraints.docData)
                  .collection('$id Series')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          StudentModel studentModel = StudentModel.fromJson(
                              (snapshot.data!.docs[index].data() as Map));

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StudentDetailsScreen(
                                  studentModel: studentModel,
                                ),
                              ));
                            },
                            child: Card(
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        FirebaseFirestore.instance
                                            .collection(AppConstraints.memberOfPadma)
                                            .doc(AppConstraints.docData)
                                            .collection('$id Series')
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
                                              MemberOfPadmaDataUpdate(
                                            studentModel: studentModel,
                                                seriesName: seriesName,
                                          ),
                                        ));
                                      },
                                      backgroundColor: Colors.red,
                                      icon: Icons.edit,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          studentModel.studentName!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          studentModel.studentDept!,
                                          style: const TextStyle(
                                            fontSize: 18,
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

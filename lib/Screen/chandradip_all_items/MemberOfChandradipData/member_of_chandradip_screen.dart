import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Screen/auth_screen/login_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/MemberOfChandradipData/member_of_chandradip_data_input.dart';
import 'package:management_app/Screen/chandradip_all_items/MemberOfChandradipData/student_name_screen.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class MemberOfChandradipScreen extends StatefulWidget {
  const MemberOfChandradipScreen({Key? key}) : super(key: key);

  @override
  State<MemberOfChandradipScreen> createState() => _MemberOfChandradipScreenState();
}

class _MemberOfChandradipScreenState extends State<MemberOfChandradipScreen> {
  FirebaseDatabaseOperation firebaseDatabaseOperation =
      FirebaseDatabaseOperation();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  int onPressCount = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              StringUtils.chandradip,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  onPressCount++;
                  if (onPressCount == 5) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                    onPressCount = 0;
                  }
                },
                icon: const Icon(Icons.info_outline),
              ),
              databaseProvider.userLogin == false ? Container() :  IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemberOfChandradipDataInput(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            ],
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(AppConstraints.seriesName)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              String id = snapshot.data!.docs[index].id;
                              var seriesName = (snapshot.data!.docs[index]
                                  .data() as Map)['series'];

                              return InkWell(
                                child: Card(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      seriesName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StudentNameScreen(
                                      id: int.parse(id),
                                      seriesName: seriesName,
                                    ),
                                  ));
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text(
                          StringUtils.noDataFound,
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
      },
    );
  }
}

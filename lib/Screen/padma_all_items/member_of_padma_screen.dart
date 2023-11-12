import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/firebase_database_operation.dart';
import 'package:management_app/Model/user_model.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_data_input.dart';

class MemberOfPadmaScreen extends StatefulWidget {
  const MemberOfPadmaScreen({Key? key}) : super(key: key);

  @override
  State<MemberOfPadmaScreen> createState() => _MemberOfPadmaScreenState();
}

class _MemberOfPadmaScreenState extends State<MemberOfPadmaScreen> {
  
  FirebaseDatabaseOperation firebaseDatabaseOperation = FirebaseDatabaseOperation();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text(
          "PADMA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MemberOfPadmaDataInput(),));
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
              stream: FirebaseFirestore.instance.collection("Member of PADMA").snapshots(),
              builder: (context, snapshot) {

                if(snapshot.connectionState == ConnectionState.active){

                  if(snapshot.hasData && snapshot.data != null){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                           // final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                           //log("document ------------------- "+documentSnapshot.id);

                          return ListTile(
                            title: Text(""),

                          );
                        },
                      ),
                    );
                  }
                  else{
                    return Text("No data found", style: TextStyle(color: Colors.red),);
                  }
                }
                else{
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

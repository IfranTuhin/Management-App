import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipPanel/chandradip_panel_data_input.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipPanel/chandradip_panel_member_name.dart';
import 'package:management_app/utils/app_constraints.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class ChandradipPanelScreen extends StatelessWidget {
  const ChandradipPanelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) => Scaffold(
      appBar: AppBar(
        title: const Text(StringUtils.chandradipPanel,style: TextStyle(fontSize: 22,color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          databaseProvider.userLogin == false ? Container() : IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChandradipPanelDataInput(),
                  ));
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(AppConstraints.sessionName)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          String id = snapshot.data!.docs[index].id;
                          var sessionName = (snapshot.data!.docs[index].data()
                          as Map)['session'];

                          return InkWell(
                            child: Card(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  sessionName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChandradipPanelMemberNameScreen(
                                  id: id,
                                  sessionName: sessionName,
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
        ),
    );
  }
}

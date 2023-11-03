import 'package:flutter/material.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_data_input.dart';

class MemberOfPadmaScreen extends StatelessWidget {
  const MemberOfPadmaScreen({Key? key}) : super(key: key);

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
            icon: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Member of padma screen"),
      ),
    );
  }
}

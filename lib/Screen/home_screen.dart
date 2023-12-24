import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Model/grid_view_model.dart';

import 'package:management_app/Screen/chandradip_all_items/ChandradipGallery/chandradip_gallery_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/chandradip_info_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipPanel/chandradip_panel_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/CoachingPanel/coaching_panel_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/Getway/getway_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/MemberOfChandradipData/member_of_chandradip_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/chandradip_notices/chandradip_notices_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/training_center/training_center_screen.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Grid view data
  final List _dataList = [
    Data(image: "assets/images/coaching.png", text: "Chandradip Member"),
    Data(image: "assets/images/group.png", text: "Chandradip Panel"),
    Data(image: "assets/images/help.png", text: "Chandradip Info"),
    Data(image: "assets/images/education.png", text: "Coaching Panel"),
    Data(image: "assets/images/gallery.png", text: "Chandradip Gallery"),
    Data(image: "assets/images/alarm.png", text: "Chandradip Notices"),
    Data(image: "assets/images/university.png", text: "Getway"),
    Data(image: "assets/images/presentation.png", text: "Training Center"),
  ];

  // List of widget
  final List<Widget> screenList = [
    MemberOfChandradipScreen(),
    ChandradipPanelScreen(),
    ChandradipInfoScreen(),
    CoachingPanelScreen(),
    ChandradipGalleryScreen(),
    CandradipNoticesScreen(),
    GatewayScreen(),
    TrainingCenterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chandradip",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          actions:  [
            databaseProvider.userLogin == false ? Container() : IconButton(
                onPressed: () async {
                  Provider.of<DatabaseProvider>(context, listen: false).logout().then((value) {
                    if (value == true) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),));
                      showSnackBarMessage(context, "Successfully Logout");
                    }
                  });
                },
                icon: const Icon(Icons.logout, color: Colors.white,)),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GridView.builder(
            itemCount: _dataList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenList[index],
                      ));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(10),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Image.asset(
                              _dataList[index].image,
                              fit: BoxFit.fill,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 13
                        ),
                        Text(
                          _dataList[index].text,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:management_app/Model/grid_view_model.dart';
import 'package:management_app/Screen/padma_all_items/CoachingPanel/coaching_panel_screen.dart';
import 'package:management_app/Screen/padma_all_items/getway_screen.dart';
import 'package:management_app/Screen/padma_all_items/MemberOfPadmaData/member_of_padma_screen.dart';
import 'package:management_app/Screen/padma_all_items/padma_gallery_screen.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/padma_info_screen.dart';
import 'package:management_app/Screen/padma_all_items/padma_notices_screen.dart';
import 'package:management_app/Screen/padma_all_items/PadmaPanel/padma_panel_screen.dart';
import 'package:management_app/Screen/padma_all_items/training_center_screen.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Grid view data
  final List _dataList = [
    Data(image: "assets/images/coaching.png", text: "Member of PADMA"),
    Data(image: "assets/images/group.png", text: "PADMA Panel"),
    Data(image: "assets/images/help.png", text: "PADMA Info"),
    Data(image: "assets/images/education.png", text: "Coaching Panel"),
    Data(image: "assets/images/gallery.png", text: "PADMA Gallery"),
    Data(image: "assets/images/alarm.png", text: "PADMA Notices"),
    Data(image: "assets/images/university.png", text: "Getway"),
    Data(image: "assets/images/presentation.png", text: "Training Center"),
  ];

  // List of widget
  final List<Widget> screenList = [
    MemberOfPadmaScreen(),
    PadmaPanelScreen(),
    PadmaInfoScreen(),
    CoachingPanelScreen(),
    PadmaGalleryScreen(),
    PadmaNoticesScreen(),
    GetwayScreen(),
    TrainingCenterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Management",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => screenList[index],));
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
                          // image: DecorationImage(
                          //   image: AssetImage(_dataList[index].image),
                          // ),
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
                        height: 13,
                      ),
                      Text(
                        _dataList[index].text,
                        style: const TextStyle(
                          fontSize: 20,
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
    );
  }
}

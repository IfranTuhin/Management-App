import 'package:flutter/material.dart';
import 'package:management_app/Screen/chandradip_all_items/Getway/contact_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/director_of_ccc.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/hief_adviser_of_ccc.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/chandradip_alumni.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/chandradip_message.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/president_of_chandradip.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/running_panel_member.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/secretary_of_chandradip.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/vision_and_mission.dart';
import 'package:management_app/Widget/custom_container.dart';
import 'package:management_app/utils/image_string.dart';
import 'package:management_app/utils/string_utils.dart';

class GatewayScreen extends StatelessWidget {
  const GatewayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DUET Gateway",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Container(
                height: screenWidth / 4,
                width: screenWidth / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
                child: const Image(image: AssetImage(ImageString.duet_logo),),
              ),

              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                  "Dhaka University of Engineering and Technology Gazipur-1700",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ),
              //
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactScreen(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.contact,
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RunningPanelMember(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.notice,
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChandradipMessage(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.website,
                      textColor: Colors.white,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PresidentOfChandradip(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.gallery,
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SecretaryOfChandradip(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.pgr,
                      textColor: Colors.white,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChandradipAlumni(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.ugr,
                      textColor: Colors.white,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HiefAdviserOfCcc(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.eLearning,
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DirectorOfCcc(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.admission,
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VisionAndMission(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.vehicleTracker,
                      textColor: Colors.white,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: screenHeight / 17,
                        width: screenWidth / 2.4 ,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Text(StringUtils.contactUs, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: screenHeight / 17,
                        width: screenWidth / 2.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: const Text(StringUtils.aboutChandradip, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


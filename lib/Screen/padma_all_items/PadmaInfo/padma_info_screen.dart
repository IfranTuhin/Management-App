import 'package:flutter/material.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/director_of_ccc.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/hief_adviser_of_ccc.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/honorable_adviser_member.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/padma_alumni.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/padma_message.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/president_of_padma.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/running_panel_member.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/secretary_of_padma.dart';
import 'package:management_app/Screen/padma_all_items/PadmaInfo/vision_and_mission.dart';
import 'package:management_app/Widget/custom_container.dart';
import 'package:management_app/utils/string_utils.dart';

class PadmaInfoScreen extends StatelessWidget {
  const PadmaInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.padmaInfo,
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
              ),
              const SizedBox(height: 10),
              const Text(
                StringUtils.padma,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      "Rajshahi Student Welfare Association\nDhaka University of Engineering and Technology\nDUET, Gazipur-1700",
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
                        builder: (context) => HonorableAdviserMember(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.honorableAdviserMember,
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RunningPanelMember(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.runningPanelMember,
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PadmaMessage(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.padmaMessage,
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
                        builder: (context) => PresidentOfPadma(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.presidentOfPadma,
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecretaryOfPadma(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.secretaryOfPadma,
                      textColor: Colors.white,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PadmaAlumni(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.padmaAlumni,
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
                      text: StringUtils.hiefAdviserOfCcc,
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
                      text: StringUtils.directorOfCcc,
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
                      text: StringUtils.visionAndMission,
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
                        child: const Text(StringUtils.aboutPadma, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
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

import 'package:flutter/material.dart';
import 'package:management_app/Screen/chandradip_all_items/Getway/contact_screen.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/chandradip_alumni.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/chandradip_message.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/president_of_chandradip.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/running_panel_member.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/secretary_of_chandradip.dart';
import 'package:management_app/Widget/custom_container.dart';
import 'package:management_app/utils/image_string.dart';
import 'package:management_app/utils/string_utils.dart';

class TrainingCenterScreen extends StatelessWidget {
  const TrainingCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Training Center',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                    "Radiate Research and Solution Limited",
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                    "406, Basonto Bilap, Monir Chemical Road DUET, Gazipur",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
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
                      text: StringUtils.ourService,
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
                      text: StringUtils.panelMember,
                      textColor: Colors.white,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChandradipMessage(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.honorableTrainer,
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
                        builder: (context) => PresidentOfChandradip(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.department,
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecretaryOfChandradip(),
                      ));
                    },
                    child: CustomContainer(
                      text: StringUtils.radiateTechnology,
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
                      text: StringUtils.info,
                      textColor: Colors.white,
                      color: Colors.indigoAccent,
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


import 'package:flutter/material.dart';
import 'package:management_app/Screen/chandradip_all_items/ChandradipInfo/widgets/president_details.dart';
import 'package:management_app/utils/image_string.dart';
import 'package:management_app/utils/string_utils.dart';


class DirectorOfCcc extends StatelessWidget {
  const DirectorOfCcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.directorOfCcc,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body:  SingleChildScrollView(
        child:   Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                // Padma Message

                Text(
                  textAlign: TextAlign.center,
                  StringUtils.honorableBoardOfDirectors,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                PresidentDetails(
                  image: ImageString.chandradipMessageImage1,
                  name: "Engr. S A Md Nahidul Haque",
                  position: "Ex-President(2009-2010), PADMA, DUET",
                  phoneNumber: "01752354200",
                ),

                PresidentDetails(
                  image: ImageString.chandradipMessageImage1,
                  name: "Engr. S A Md Nahidul Haque",
                  position: "Ex-President(2009-2010), PADMA, DUET",
                  phoneNumber: "01752354200",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

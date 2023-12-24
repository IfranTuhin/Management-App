import 'package:flutter/material.dart';
import 'package:management_app/utils/image_string.dart';
import 'package:management_app/utils/string_utils.dart';

class ChandradipMessage extends StatelessWidget {
  const ChandradipMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.chandradipMessage2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const SingleChildScrollView(
        child:   Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 40),
                // Padma Message
                 Text(
                  textAlign: TextAlign.center,
                  StringUtils.messageAboutChandradipConfidentCoaching,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        
                // Image
                 member_widgets(),
                 member_widgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class member_widgets extends StatelessWidget {

  const member_widgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 80,
          child: const Image(image: AssetImage(ImageString.chandradipMessageImage1)),
        ),
        // Name
        const Text(StringUtils.SAMdNahidulHaque,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
        const Text(StringUtils.SAMdNahidulHaquePosition,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),

        // Long text
        RichText(
          overflow: TextOverflow.clip,
          text: const TextSpan(
            text: StringUtils.SAMdNahidulHaquePositionText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),

          ),
        ),
      ],
    );
  }
}

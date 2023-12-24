import 'package:flutter/material.dart';
import 'package:management_app/utils/image_string.dart';

class PresidentDetails extends StatelessWidget {

  String ? image, name, position, phoneNumber;
   PresidentDetails({
    this.image,
    this.name,
    this.position,
    this.phoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 80,
          child: Image(image: AssetImage(image!)),
        ),
        // Name
         Text(name!,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
         Text(position!,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
         Text(phoneNumber!,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
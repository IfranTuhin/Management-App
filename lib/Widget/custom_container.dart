import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {

  Color ? color;
  String ? text;
  Color ? textColor;

  CustomContainer({Key? key, this.color, this.text, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3.3,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(text!,style: TextStyle(fontSize: 16,color: textColor),textAlign: TextAlign.center,),
    );
  }
}

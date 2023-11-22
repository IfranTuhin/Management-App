import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  TextInputType textInputType;
   InputTextField({Key? key, required this.textEditingController, required this.hintText, required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

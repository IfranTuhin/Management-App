import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  TextInputType textInputType;
  bool? enabled;
   InputTextField({Key? key, required this.textEditingController, required this.hintText, required this.textInputType, this.enabled}) : super(key: key);

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
          enabled: true,

        ),
      ),
    );
  }
}

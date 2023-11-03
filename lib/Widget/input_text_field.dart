import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
   InputTextField({Key? key, required this.textEditingController, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

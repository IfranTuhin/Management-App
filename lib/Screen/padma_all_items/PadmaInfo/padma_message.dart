import 'package:flutter/material.dart';
import 'package:management_app/utils/string_utils.dart';


class PadmaMessage extends StatelessWidget {
  const PadmaMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(StringUtils.padmaMessage),
      ),
    );
  }
}

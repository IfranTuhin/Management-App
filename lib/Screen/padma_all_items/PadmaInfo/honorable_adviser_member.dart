import 'package:flutter/material.dart';
import 'package:management_app/utils/string_utils.dart';


class HonorableAdviserMember extends StatelessWidget {
  const HonorableAdviserMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(StringUtils.honorableAdviserMember),
      ),
    );
  }
}

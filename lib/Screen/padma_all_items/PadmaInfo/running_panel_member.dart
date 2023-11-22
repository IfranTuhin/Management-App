import 'package:flutter/material.dart';
import 'package:management_app/utils/string_utils.dart';


class RunningPanelMember extends StatelessWidget {
  const RunningPanelMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(StringUtils.runningPanelMember),
      ),
    );
  }
}

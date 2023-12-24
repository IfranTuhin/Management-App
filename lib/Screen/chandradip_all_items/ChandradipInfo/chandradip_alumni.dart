import 'package:flutter/material.dart';
import 'package:management_app/utils/string_utils.dart';


class ChandradipAlumni extends StatelessWidget {
  const ChandradipAlumni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(StringUtils.chandradipAlumni),
      ),
    );
  }
}

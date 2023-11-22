import 'package:flutter/material.dart';


class CircleContainer extends StatelessWidget {
  double height;
  double width;
  Widget child;
  CircleContainer({Key? key, required this.height, required this.width, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green
      ),
      child: child,
    );
  }
}

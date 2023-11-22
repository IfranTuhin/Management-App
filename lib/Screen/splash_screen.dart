import 'package:flutter/material.dart';
import 'package:management_app/Screen/home_screen.dart';
import 'package:management_app/utils/string_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // set delay to splash screen
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(StringUtils.welcomeText,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),))
        ],
      ),
    );
  }
}

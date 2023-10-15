import 'package:flutter/material.dart';
import 'package:management_app/Screen/home_screen.dart';

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
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Welcome!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),))
          ],
        ),
      ),
    );
  }
}

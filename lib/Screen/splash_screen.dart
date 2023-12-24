import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Screen/auth_screen/login_screen.dart';
import 'package:management_app/Screen/home_screen.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // set delay to splash screen
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {

      Provider.of<DatabaseProvider>(context, listen: false).isLogin().then((value) {

        if(value == true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }

      });

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

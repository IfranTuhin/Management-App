import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Screen/auth_screen/signup_screen.dart';
import 'package:management_app/Screen/home_screen.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextExiting controller
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringUtils.loginScreen,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
          return Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                InputTextField(
                  textEditingController: emailController,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                InputTextField(
                  textEditingController: passwordController,
                  hintText: "Password",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),
                databaseProvider.isLoading ? CircularProgressIndicator() : InkWell(
                  onTap: () {

                    databaseProvider.login(emailController.text, passwordController.text, (int value){
                      if(value == 1){
                        showSnackBarMessage(context, StringUtils.successfullyLogin,isError: false);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
                      }else{
                        showSnackBarMessage(context, StringUtils.loginFailed,isError: false);
                      }
                    }, context);

                  },
                  child: CustomButton(
                    buttonText: 'Login',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },
                  // padding: EdgeInsets.zero,
                  child: const Text(
                    "Create account!!",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

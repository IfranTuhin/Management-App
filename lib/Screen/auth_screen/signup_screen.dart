import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Screen/auth_screen/login_screen.dart';
import 'package:management_app/Widget/custom_button.dart';
import 'package:management_app/Widget/custom_message.dart';
import 'package:management_app/Widget/input_text_field.dart';
import 'package:management_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextExiting controller
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringUtils.signUpScreen,
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
                SizedBox(height: 20),
                InputTextField(
                  textEditingController: nameController,
                  hintText: "Name",
                  textInputType: TextInputType.emailAddress,
                ),
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
                databaseProvider.isLoading
                    ? CircularProgressIndicator()
                    : InkWell(
                        onTap: () async {
                          databaseProvider.createUser(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                              (int value){
                                if(value == 1){
                                  showSnackBarMessage(context, StringUtils.successfullySignUp,isError: false);
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
                                }else{
                                  showSnackBarMessage(context, StringUtils.signUpFailed,isError: false);
                                }
                              }
                          );
                        },
                        child: CustomButton(
                          buttonText: 'Sign Up',
                        ),
                      ),
                const SizedBox(height: 10),
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  // padding: EdgeInsets.zero,
                  child: const Text(
                    "Login",
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

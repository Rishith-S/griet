import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seller_app/reusable_components/reusable_widget.dart';
import 'package:seller_app/Screens/home_screen.dart';
import 'package:seller_app/Screens/reset_password.dart';
import 'package:seller_app/Screens/signup_screen.dart';
import 'package:seller_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("3b93a0"),
            hexStringToColor("3b93a0"),
            hexStringToColor("3b93a0")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius:60,
                foregroundImage: AssetImage(
                    "assests/images/pic.jpeg"
                ),
              ),
              const SizedBox(
                height: 25
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 5,
              ),
              forgetPassword(context),
              firebaseUIButton(context, "Sign In", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BApp()));
                }).onError((error, stackTrace) {
                  Get.snackbar("About User", "User message",
                      backgroundColor: Colors.redAccent,
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Text(
                        "Account Login Failed ",
                        style: TextStyle(
                            color:Colors.white
                        ),
                      ),
                      messageText: Text(
                          error.toString(),
                          style: TextStyle(
                              color:Colors.white
                          )
                      )
                  );
                });
              }),
              signUpOption()
            ],
          ),
        ),
      ),
        ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
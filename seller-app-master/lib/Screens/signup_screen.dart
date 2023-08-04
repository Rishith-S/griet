import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seller_app/Screens/signin_screen.dart';
import 'package:seller_app/reusable_components/reusable_widget.dart';
import 'package:seller_app/Screens/home_screen.dart';
import 'package:seller_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _mobileTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
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
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Mobile Number", Icons.lock_outlined, false,
                        _mobileTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up",() async{
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        //createUser(_emailTextController.text, _userNameTextController.text, _mobileTextController.text);
                      }).onError((error, stackTrace) {
                        Get.snackbar("About User", "User message",
                            backgroundColor: Colors.redAccent,
                            snackPosition: SnackPosition.BOTTOM,
                            titleText: Text(
                              "Account Creation Failed ",
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
                      await createUser( _emailTextController.text ,_userNameTextController.text ,_mobileTextController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInScreen()));
                    })
                  ],
                ),
              ))),
    );

  }
  Future<void> createUser(String mail, String userName,String mobile) async {
    String? uid=FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection("sellers").doc(uid).set({
      "username": userName,
      "Email": mail,
      "Mobile number":mobile,
      "loaction":"",
    });
  }
}
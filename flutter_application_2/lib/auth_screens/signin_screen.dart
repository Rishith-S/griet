import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_application_1/reusable_widgets/reusable_widget.dart';
// import 'package:flutter_application_1/screens/home_screen.dart';
// import 'package:flutter_application_1/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth_screens/colors.dart';
import 'package:flutter_application_2/auth_screens/reused.dart';
import 'package:flutter_application_2/screens/big_home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 66, 135, 100),
          // decoration: BoxDecoration(
          // //     gradient: LinearGradient(colors: [
          // //   // hexStringToColor("3b93a0"),
          // //   // hexStringToColor("3b93a0"),
          // //   // hexStringToColor("3b93a0")
          // // ], 
          // begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Address", Icons.location_city, false,
                    _addresscontroller),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () async {
                  UserCredential? res = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BApp()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                  print('uid');
                  String uid = FirebaseAuth.instance.currentUser!.uid;
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .set({
                    'uid': uid,
                    'name': _userNameTextController.text,
                    'email': _emailTextController.text,
                    'address': _addresscontroller.text,
                    'password': _passwordTextController.text,
                  });
                })
              ],
            ),
          ))),
    );
  }
}

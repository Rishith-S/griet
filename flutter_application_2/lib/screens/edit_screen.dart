import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screens/user_screen.dart';
// import 'package:velocity_x/velocity_x.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 223, 204),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 223, 204),
        elevation: 0,
      ),
      body: Wrap(children: [
        Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // color: const Color.fromARGB(255, 244, 241, 241),
                      color: const Color.fromARGB(255, 204, 223, 204),
                      child: TextFormField(
                        // initialValue: "gfhk",
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          hintText: 'Enter Name',
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // color: const Color.fromARGB(255, 244, 241, 241),
                      color: const Color.fromARGB(255, 204, 223, 204),
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          hintText: 'Enter Email',
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // color: const Color.fromARGB(255, 244, 241, 241),
                      color: const Color.fromARGB(255, 204, 223, 204),
                      child: TextFormField(
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          hintText: 'Enter Password',
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      'Address',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // color: const Color.fromARGB(255, 244, 241, 241),
                      color: const Color.fromARGB(255, 204, 223, 204),
                      child: TextFormField(
                        controller: addresscontroller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            // borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          hintText: 'Enter Address',
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 160, right: 20, top: 20, bottom: 10),
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .update({
                                'name':namecontroller.text,
                                'email':emailcontroller.text,
                                'password':passwordcontroller.text,
                                'address':addresscontroller.text,
                              });
                            const snackBar =  SnackBar(
                              content:  Text('Edit details saved'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

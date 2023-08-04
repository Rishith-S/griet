import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String uid=FirebaseAuth.instance.currentUser!.uid;
  TextEditingController username=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController mobilenumber=TextEditingController();
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Update User Details")),
        elevation: 0,
      ),
      body: SingleChildScrollView(
       physics: AlwaysScrollableScrollPhysics(),
        child: Wrap(
            children:[
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
                        padding:
                        EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Container(
                          // color: const Color.fromARGB(255, 244, 241, 241),
                          color: const Color.fromARGB(255, 204, 223, 204),
                          child: TextFormField(
                            controller: username,
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
                        padding:
                        EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Container(
                          // color: const Color.fromARGB(255, 244, 241, 241),
                          color: const Color.fromARGB(255, 204, 223, 204),
                          child: TextFormField(
                            controller: email,
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
                        padding:
                        EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        child: Text(
                          'Location',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Container(
                          // color: const Color.fromARGB(255, 244, 241, 241),
                          color: const Color.fromARGB(255, 204, 223, 204),
                          child: TextFormField(
                            controller: location,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              hintText: 'Enter Location',
                              fillColor: Colors.white,
                              hintStyle: TextStyle(color: Colors.grey),
                              // suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Container(
                          // color: const Color.fromARGB(255, 244, 241, 241),
                          color: const Color.fromARGB(255, 204, 223, 204),
                          child: TextFormField(
                            controller: mobilenumber,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              hintText: 'Enter Mobile Number',
                              fillColor: Colors.white,
                              hintStyle: TextStyle(color: Colors.grey),
                              // suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
                            child: TextButton(
                              style: TextButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: ()async {
                                  await FirebaseFirestore.instance.collection("sellers").doc(uid).update({
                                     'L zocation':location.text,
                                     'username':username.text,
                                     'Mobile number':mobilenumber.text,
                                     'email':email.text,

                                   }).then((value) => Navigator.pop(context));
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(color:Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width:30),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.0,8.0,8.0,8.0),
                            child: TextButton(
                              style: TextButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: (){
                                setState(() {
                                  location=TextEditingController(text: "");
                                  mobilenumber=TextEditingController(text: "");
                                  username=TextEditingController(text: "");
                                  email=TextEditingController(text: "");
                                });
                              },
                              child: const Text(
                                'clear',
                                style: TextStyle(color:Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            ]
        ),
      ),
    );
  }
}
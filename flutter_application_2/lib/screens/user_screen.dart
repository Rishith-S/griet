import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth_screens/login_screen.dart';
// import 'package:flutter_application_2/authscreen/signin_screen.dart';
import 'package:velocity_x/velocity_x.dart';

// import '../auth_screens/signin_screen.dart';
import 'edit_screen.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  var edit = const Edit();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<String>> getUsername() async {
    List<String> res = [];
    // Getting current user
    // User? currentUser = _auth.currentUser as User?;
    // Getting the username
    try {
      var value = await _firestore.collection('users').doc(uid).get();
      var username = await value.data()!["name"];
      var email = await value.data()!["email"];
      var address = await value.data()!["address"];
      // print(username);
      res.add(username);
      res.add(email);
      res.add(address);
      return res;
    } catch (e){}
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 223, 204),
        body: Center(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: FutureBuilder(
                          future: getUsername(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Name : ${snapshot.data?[0]}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Email : ${snapshot.data?[1]}',
                                  style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Address : ${snapshot.data?[2]}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 5, 5, 5)),
                                ),
                              ],
                            );
                          }),
                    ),
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 111, 154, 63)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Edit()),
                            
                          );
                          // setState(() {
                            
                          // });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 111, 154, 63)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

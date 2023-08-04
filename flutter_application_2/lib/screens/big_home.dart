// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/cart_screen.dart';
import 'package:flutter_application_2/screens/collections_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/user_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(BApp());
// }

class BApp extends StatefulWidget {
  const BApp({super.key});

  @override
  State<BApp> createState() => _AppState();
}

class _AppState extends State<BApp> {
  int val = 0;
  // var controller = Get.put(Appcontroller());
  var navbar = [
     const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.category, color: Colors.white), label: 'Categories'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart, color: Colors.white), label: 'Cart'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person, color: Colors.white), label: 'User'),
  ];

  var navbody = [
    const Home(),
    const Categories(),
    const Cart(),
    const User(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Center(child: Text('FarmMart')),
            backgroundColor: const Color.fromARGB(255,23, 108, 76),
          ),
          body: navbody[val],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: val,
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor: const Color.fromARGB(255, 23, 108, 76),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(255, 188, 220, 247),
            selectedFontSize: 15,
            unselectedFontSize: 13,
            items: navbar,
            onTap: (value) {
              setState(() {
                val = value;
              });
            },
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:seller_app/Screens/Orders.dart';
//import 'package:seller_app/Screens/screen.dart';
//import 'package:seller_app/Screens/collections_screen.dart';
import 'package:seller_app/Screens/home_screen.dart';
import 'package:seller_app/Screens/user.dart';
import 'package:seller_app/Screens/weather.dart';

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
        icon: Icon(Icons.category, color: Colors.white), label: 'Orders'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.cloud_circle_outlined, color: Colors.white), label: 'Weather'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person, color: Colors.white), label: 'User'),
  ];

  var navbody = [
    home(),
     Orders(),
     Weather(),
     User(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   title: const Center(child: Text('FarmMart')),
          //   backgroundColor: const Color.fromARGB(255, 30, 141, 98),
          // ),
          body: navbody[val],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: val,
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor:  Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 188, 220, 247),
            selectedFontSize: 15,
            unselectedFontSize: 13,
            // fixedColor: Colors.black,
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
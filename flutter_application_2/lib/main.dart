

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_application_1/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth_screens/login_screen.dart';
import 'package:flutter_application_2/screens/big_home.dart';
import 'package:flutter_application_2/screens/edit_screen.dart';
import 'package:flutter_application_2/screens/user_screen.dart';

// import 'auth_screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
          'edit': (context) => const Edit(),
          // 'user': (context) => const User(),
        },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)  {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const BApp();
              }
            }
            return const SignInScreen();
          },
        ));
  }
}



// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screens/cart_screen.dart';
// import 'package:flutter_application_2/screens/collections_screen.dart';
// import 'package:flutter_application_2/screens/home_screen.dart';
// import 'package:flutter_application_2/screens/user_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(App());
// }

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   int val = 0;
//   // var controller = Get.put(Appcontroller());
//   var navbar = [
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.home,
//           color: Colors.white,
//         ),
//         label: 'Home'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.category, color: Colors.white), label: 'Categories'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.shopping_cart, color: Colors.white), label: 'Cart'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.person, color: Colors.white), label: 'User'),
//   ];

//   var navbody = [
//     const Home(),
//     const Categories(),
//     const Cart(),
//     const User(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             title: Center(child: Text('Farmer E-Kart')),
//             backgroundColor: Color.fromARGB(255, 30, 141, 98),
//           ),
//           body: navbody[val],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: val,
//             type: BottomNavigationBarType.fixed, // Fixed
//             backgroundColor: Color.fromARGB(255, 23, 108, 76),
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Color.fromARGB(255, 188, 220, 247),
//             selectedFontSize: 15,
//             unselectedFontSize: 13,
//             // fixedColor: Colors.black,
//             items: navbar,
//             onTap: (value) {
//               setState(() {
//                 val = value;
//               });
//             },
//           ),
//         ));
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/authscreen/signin_screen.dart';
// // import 'package:my_first_project/screens/signin_screen.dart';
// // import 'package:my_first_project/screens/signup_screen.dart';
// // import 'package:my_first_project/screens/home_screen.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SignInScreen(),
//     );
//   }
// }


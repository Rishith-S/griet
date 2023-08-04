import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seller_app/LocaleString.dart';
import 'package:seller_app/Screens/home_screen.dart';
import 'package:seller_app/Screens/navigation.dart';
import 'package:seller_app/Screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/LocaleString.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        // translations: LocaleString(),
        // locale: Locale('en','US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        // supportedLocales: L10n.all ,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)  {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return BApp();
              }
            }
            return SignInScreen();
          },
        )
    );
  }
}
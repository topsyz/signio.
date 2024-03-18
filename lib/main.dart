import 'package:flutter/material.dart';
import 'package:untitled18/SCREENS/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled18/SCREENS/RegisterWithPhoneNumber.dart';
import 'package:untitled18/SCREENS/home_screen.dart';
import 'package:untitled18/SCREENS/landing_page.dart';
import 'package:untitled18/SCREENS/verification.dart';
import 'package:untitled18/SCREENS/welcomescreen.dart';
import 'package:untitled18/SCREENS/login_screen.dart';
import 'package:untitled18/SCREENS/signup_screen.dart';
import 'package:untitled18/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'landingpage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // home: const Auth(),
      routes: {
        'landingpage':(context)=> const Landingpage(),
        'signupScreen':(context)=>const signupScreen(),
        'loginScreen':(context)=>const LoginScreen(),
        'welcomescreen':(context)=> const welcomescreen(),
        '/':(context)=> const Auth(),
        'homescreen':(context)=>const homescreen(),
        'Verificatoin':(context)=> const Verificatoin(),
        'RegisterWithPhoneNumber':(context)=>const RegisterWithPhoneNumber(),
      },
    );
  }
}
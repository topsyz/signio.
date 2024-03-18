import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled18/SCREENS/welcomescreen.dart';
import 'package:untitled18/SCREENS/login_screen.dart';
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context,snapshot){
          if (snapshot.hasData){
            return const welcomescreen();
          } else{
            return const LoginScreen();
          }
        } ),
      ),
    );
  }
}







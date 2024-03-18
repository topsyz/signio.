import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({super.key});

  @override
  State<welcomescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<welcomescreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ const Text
          ('Hello, you are signed in',
          style: TextStyle(fontSize: 22),
        ),
          Text(
            user.email!,
            style: TextStyle(fontSize: 22),
          ),
          MaterialButton(onPressed:(){FirebaseAuth.instance.signOut();
          },
            color: Colors.amber[900],
            child: Text('sign out'),
          ),
        ],
      )
      ) ,
    );
  }
}

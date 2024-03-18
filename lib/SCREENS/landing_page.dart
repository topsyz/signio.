import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled18/SCREENS/contants/app_contants.dart';
import 'package:untitled18/SCREENS/login_screen.dart';
import 'package:untitled18/SCREENS/signup_screen.dart';
class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcontants.backgroundcolor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.50,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage(Appcontants.landingimage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),)
                  ),
                ),
                SizedBox(height: 40,) ,
                SizedBox(
                  width: MediaQuery.of(context).size.width*.9,
                  child: const Text (Appcontants.securityText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 29,
                      fontWeight: FontWeight.bold,),
                  ),
                ),
                const SizedBox(height: 20,),
                 const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.8,
                  child:const Text(Appcontants.discriptionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),),
                )
              ],
            ),
            ),
          ),
          Container(
            height: 150,
            //color: Colors.amber[900],
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:Border.all(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: _buildButton(
                    title: Appcontants.registerText, color:Colors.amber[900],onTap:(){
    Navigator.of(context).push(MaterialPageRoute(
      builder:(context)=> signupScreen(),),);})),
                   const SizedBox(width: 10,),
                  Expanded(child: _buildButton(title: "Sign In",onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=> LoginScreen(),));
                  },
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
  _buildButton({String? title, color,VoidCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
                color:color?? Colors.white,

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            title ?? "Sign In",
            style:GoogleFonts.robotoCondensed(),
            textAlign: TextAlign.center
            ,),
        ),
      ),
    );
  }
}

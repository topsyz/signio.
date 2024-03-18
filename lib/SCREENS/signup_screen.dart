import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled18/SCREENS/RegisterWithPhoneNumber.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _emailController = TextEditingController();
  final _passwordlController = TextEditingController();
  final _confirmpasswordlController = TextEditingController();

  Future signUp() async {
    if (passworconfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordlController.text.trim(),
      );
      Navigator.of(context).pushNamed('/');
    }
  }

  bool passworconfirmed() {
    if (_passwordlController.text.trim() ==
        _confirmpasswordlController.text.trim()) {
      return true;
    }
    else {
      return false;
    }
  }

  void opensignupScreen() {
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordlController.dispose();
    _confirmpasswordlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text('SIGN UP',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                //subtitle
                Text('here you can sign up',
                  style: GoogleFonts.robotoCondensed(fontSize: 18),
                ),
                SizedBox(height: 50,),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'email',
                          )
                      ),
                    ),
                  ),
                ), SizedBox(height: 10,),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          controller: _passwordlController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password',
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                //confirmed password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          controller: _confirmpasswordlController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'confirm password',
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(child: Text('SIGN UP'
                          , style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),))
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (Context)=>RegisterWithPhoneNumber()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(child: Text('Register With Your Phone Number'
                          , style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )
                          ,))
                    ),
                  ),
                ),
                SizedBox(height: 15,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customcontaine(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("or continue with"),
                    ),
                    _customcontaine(context, reversed: true),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customImageItem(
                        imagepath: "assets/images/icons8-gmail-192(-xxxhdpi).png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: _customImageItem(
                          imagepath: "assets/images/icons8-apple-logo-200(-xxxhdpi).png"),),
                    _customImageItem(
                        imagepath: "assets/images/icons8-facebook-288(-xxhdpi).png"),
                  ],
                ),
                SizedBox(height: 26,),
                //sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already yet a member ?',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,
                      ),),
                    GestureDetector(
                      onTap: opensignupScreen,
                      child: Text('sign In here',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customcontaine(context, {bool reversed = false}) {
    return Container(
      height: 2,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: reversed ? LinearGradient(colors: [
          Colors.grey,
          Colors.transparent,

        ],
        ) : LinearGradient(colors: [
          Colors.transparent,
          Colors.grey,
        ],
        ),
      ),
    );
  }

  _customImageItem({required String imagepath}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Image.asset(imagepath),
      height: 75,
      width: 75,
    );
  }
}

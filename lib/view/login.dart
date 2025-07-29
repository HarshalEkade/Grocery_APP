import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/view/register.dart';

import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 75,
                    width: 68,
                    child: Image.asset(
                      "assets/Group.png",
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Loging",
                style: GoogleFonts.dmSans(
                    fontSize: 27, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Enter your emails and password",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Email",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromRGBO(0, 0, 0, 0.04)),
                    ]),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                        color: Colors.white,
                    )),
                    hintText: "abc@gmail.com",
                  ),
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(24, 23, 37, 1)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromRGBO(0, 0, 0, 0.04)),
                    ]),
                child: TextField(
                  controller: passController,
                  obscureText: hide,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          hide = !hide;
                        });
                      },
                      child: (hide)
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.remove_red_eye_outlined),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    hintText: "**********",
                  ),
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(24, 23, 37, 1)),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.dmSans(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  if (emailController.text.trim().isNotEmpty &&
                      passController.text.trim().isNotEmpty) {
                    try {
                      UserCredential userCredential =
                          await _firebaseAuth.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passController.text.trim(),
                      );
                      log("UserCredentials : ${userCredential.user!.email!}");

                      // Navigate to HomeScreen on successful login
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    } on FirebaseAuthException catch (error) {
                      log("FirebaseAuthException Code: ${error.code}");
                      log("FirebaseAuthException Message: ${error.message}");

                      // Display the error as a SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            error.message ?? "An error occurred",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    } catch (error) {
                      // Catch any other errors (optional)
                      log("An unexpected error occurred: $error");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "An unexpected error occurred",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  } else {
                    // Show error if email or password is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.orange,
                        content: Text(
                          "Please enter both email and password",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 70,
                  width: 374,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(83, 177, 117, 1),
                  ),
                  child: Center(
                    child: Text(
                      "Login In",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.dmSans(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                    },
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

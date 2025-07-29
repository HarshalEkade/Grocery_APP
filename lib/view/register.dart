import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  
  bool hide=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Register",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration:const InputDecoration(
                hintText: "Enter your email",
                hintStyle:  TextStyle(
                  color: Colors.white,
                  fontSize: 19,

                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: hide,
              controller: passController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Enter your Password",
                hintStyle:  const TextStyle(
                  color: Colors.white,
                  fontSize: 19,

                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    setState(() {
                      hide = !hide;
                    });
                  },
                  child: Icon(
                    (hide)?Icons.visibility_off_outlined:Icons.visibility,
                    color: Colors.white,
                  ),
                )
              ),
            ),
          ),
          GestureDetector(
            
            onTap: ()async{
              if(emailController.text.trim().isNotEmpty && passController.text.trim().isNotEmpty){
                try{
                  UserCredential userCredential=await _firebaseAuth.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passController.text.trim(),
                  );
                  log("User Credential :$userCredential");
                  const SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text(
                      "User Register Successfully",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                      ),
                      
                  );
                  Navigator.of(context).pop();
                }on FirebaseAuthException catch (error){
                  log(error.code);
                  log("${error.message}");
                  SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text("${error.message}",style: const TextStyle(
                      fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                  );
                } catch(error){
                  log("An unexpected error occurred: $error");
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                    const SnackBar(
                      backgroundColor: Colors.amber,
                      content: Text(
                        " An Unexpected Error ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text(
                      "Please enter both email and password",
                      style: TextStyle(color: Colors.white),
                    )
                  ),
                );
              }
              
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
              child: const Text(
                "Register User",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}
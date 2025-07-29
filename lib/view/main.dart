import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/view/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyA6AkjD5652v31YwnrvfKl_xUp6G1RbN-I",
      appId: "1:758912407674:android:383e0c2f14c41027b843c3",
      messagingSenderId: "758912407674",
      projectId: "grocery-app-d1d7e",
      
    )
  );
  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context){
          return const LoginScreen();
        })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children:[ Column(
          children: [
            Image.asset("assets/Splash Screen.png"),
          ],
        ),
        ]
      ),
    );
  }
}

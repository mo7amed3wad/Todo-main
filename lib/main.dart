import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:todo_app/medules/homeScreen/homeScreen.dart';
import 'package:todo_app/shared/network/local/localStorage.dart';

import 'medules/loginScreen/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

// ignore: non_constant_identifier_names

late BuildContext context;

@override
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checlogin();
  }

  Widget currentpage = LoginScreen();
  void checlogin() async {
    String? token = await getData();
    print("token" + token.toString());
    if (token != null) {
      setState(() {
        currentpage = HomeScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentpage,
    );
  }
}

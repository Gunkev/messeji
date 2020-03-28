import 'package:flutter/material.dart';
import 'package:messeji/screens/HomeScreen.dart';
import 'package:messeji/screens/SignUpScreen.dart';
import 'package:messeji/screens/LoginScreen.dart';
import 'package:messeji/screens/ChatScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff3f317a),
        accentColor: Colors.white,
        primaryColor: Color(0xff3f317a)
      ),
     initialRoute: AppHomeScreen.id,
      routes: {
        AppHomeScreen.id: (context)=> AppHomeScreen(),
        LoginScreen.id: (context)=> LoginScreen(),
        SignUpScreen.id: (context)=> SignUpScreen(),
        ChatScreen.id: (context)=> ChatScreen(),
      }
    );
  }
}




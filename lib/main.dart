import 'package:flutter/material.dart';
import 'package:messeji/screens/IntroAppScreen.dart';
import 'package:messeji/screens/SignUpScreen.dart';
import 'package:messeji/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff3f317a),
        accentColor: Colors.white,
      ),
     initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen()
      },
    );
  }
}




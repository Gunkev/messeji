import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class IntroAppScreen extends StatefulWidget {
  @override
  _IntroAppScreenState createState() => _IntroAppScreenState();
}

class _IntroAppScreenState extends State<IntroAppScreen> {

  @override
  void initState() {
    super.initState();
    splashScreen();
  }
  // wait for 4 seconds then push the signUp screen
  splashScreen() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, navigationScreen);
  }

  void navigationScreen() {
    Navigator.of(context).pushReplacementNamed('/signUpScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/chatbg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
//              child: SpinKitCircle(
//                size: 50.0,
//                duration: Duration(seconds: 5),
//              ),
            )
          ],
        ),
      ),
    );
  }
}

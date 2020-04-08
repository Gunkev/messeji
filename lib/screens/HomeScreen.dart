import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messeji/utilities/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:messeji/screens/LoginScreen.dart';
import 'package:messeji/screens/SignUpScreen.dart';
import 'package:messeji/components/ChatRaisedButton.dart';


class AppHomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}
class _AppHomeScreenState extends State<AppHomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    // animation duration
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Color(0xff3f317a), end: kWhiteColor).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
      print(controller.value);
    });
  }

  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Icon(
                    EvaIcons.messageSquare, size: 100.0, color: kWhiteColor,
                  ),
                ),
                Text('Welcome to Messeji',textAlign: TextAlign.center, style: TextStyle( color: kWhiteColor, fontSize: 25, fontWeight: FontWeight.w500),),
                SizedBox(height: kLargeVerticalSpace),
                ChatRaisedButton(
                  onPress: () {Navigator.pushNamed(context, SignUpScreen.id);},
                  colour: kButtonColour,
                  padding: kButtonPadding,
                  title: 'SIGN UP',
                ),
                SizedBox(height: kMediumVerticalSpace),
                ChatRaisedButton(
                  onPress: () {Navigator.pushNamed(context, LoginScreen.id);},
                  colour: kButtonColour,
                  padding: kButtonPadding,
                  title: 'LOGIN',
                ),
                SizedBox(height: kSmallVerticalSpace),
                Text('Chat with the world',style: TextStyle(color: kPinkColor, fontSize: 12.0,), textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

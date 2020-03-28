import 'package:flutter/material.dart';
import 'package:messeji/utilities/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:messeji/components/ChatRaisedButton.dart';

class SignUpScreen extends StatefulWidget {

  static const String id = 'signUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: kBackgroundGradient,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 70.0,
                            child: Icon(
                              EvaIcons.messageSquare, size: 70.0, color: kWhiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: kLargeVerticalSpace),
                        Container(
                          child: TextField(
                            autofocus: false,
                            style: TextStyle(color: kWhiteColor),
                            decoration: kTextFieldDecoration.copyWith(hintText: 'username@domain.com'),
                          ),
                        ),
                        SizedBox(height: kSmallVerticalSpace),
                        Container(
                          child: TextField(
                            autofocus: false,
                            style: TextStyle(color: kWhiteColor),
                            decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        ChatRaisedButton(
                          onPress: () {},
                          colour: kButtonColour,
                          padding: kButtonPadding,
                          title: 'LOGIN',
                        ),
                        SizedBox(height: kMediumVerticalSpace),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

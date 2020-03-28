import 'package:flutter/material.dart';
import 'package:messeji/utilities/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:messeji/components/ChatRaisedButton.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                EvaIcons.messageSquare, size: 70.0, color: kWhiteColor,
                              ),
                              Text('Messeji', style: TextStyle( color: kWhiteColor, fontSize: 25, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        SizedBox(height: 100.0),
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
                        SizedBox(height: kMediumVerticalSpace),
                        ChatRaisedButton(
                          onPress: () {},
                          colour: kButtonColour,
                          padding: kButtonPadding,
                          title: 'LOGIN',
                        ),
                        SizedBox(height: kSmallVerticalSpace),
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


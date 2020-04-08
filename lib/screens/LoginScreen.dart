import 'package:flutter/material.dart';
import 'package:messeji/screens/ChatScreen.dart';
import 'package:messeji/utilities/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:messeji/components/ChatRaisedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loader,
        child: SingleChildScrollView(
          child: Container(
            height: 760.0,
            decoration: kBackgroundGradient,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
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
                              onChanged: (value) {
                                email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: TextStyle(color: kWhiteColor),
                              decoration: kTextFieldDecoration.copyWith(hintText: 'username@domain.com'),
                            ),
                          ),
                          SizedBox(height: kSmallVerticalSpace),
                          Container(
                            child: TextField(
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: true,
                              autofocus: false,
                              style: TextStyle(color: kWhiteColor),
                              decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
                            ),
                          ),
                          SizedBox(height: kMediumVerticalSpace),
                          ChatRaisedButton(
                            onPress: () async {
                              setState(() {
                                loader = true;
                              });
                              try {
                                final user =  await _auth.signInWithEmailAndPassword(email: email, password: password);
                                if(user != null) {
                                  Navigator.pushNamed(context, ChatScreen.id);
                                }
                                setState(() {
                                  loader = false;
                                });
                              }
                              catch(e) {
                                print(e);
                              }
                            },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


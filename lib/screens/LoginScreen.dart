import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var gradientStart = Color(0xff3f317a);
  var gradientStop = Color(0xff261e4b);
  static String id = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStart,gradientStop],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            EvaIcons.messageSquare, size: 100.0, color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          child: TextField(
                            autofocus: false,
                            style: TextStyle(color: Color(0xffffffff)),
                            decoration: InputDecoration(
                              hintText: "user@email.com",
                              hintStyle: TextStyle(color: Color(0xffa8a5b7),),
                              contentPadding: EdgeInsets.all(17.0),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xfffffffff), width: 1.0)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffe91e63), width: 1.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          child: TextField(
                            autofocus: false,
                            style: TextStyle(color: Color(0xffffffff)),
                            decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: TextStyle(color: Color(0xffa8a5b7)),
                              contentPadding: EdgeInsets.all(17.0),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xfffffffff), width: 1.0)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffe91e63), width: 1.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        RaisedButton(
                          color: Color(0xffe91e63),
                          padding: EdgeInsets.all(18.0),
                          onPressed: () {},
                          child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.0)),
                        ),
                        SizedBox(height: 20.0),

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

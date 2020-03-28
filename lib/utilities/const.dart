import 'package:flutter/material.dart';
const kButtonColour = Color(0xffe91e63);
const kButtonPadding = EdgeInsets.all(18.0);
const kSmallVerticalSpace = 10.0;
const kMediumVerticalSpace = 20.0;
const kLargeVerticalSpace = 100.0;
const kWhiteColor = Color(0xffffffff);
const kHintTextColor = Color(0xffa8a5b7);
const kPinkColor = Color(0xffe91e63);
const gradientStart = Color(0xff3f317a);
const gradientStop = Color(0xff261e4b);
const kBackgroundGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [gradientStart, gradientStop],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
    ),
);
const kTextFieldDecoration = InputDecoration(
hintText: 'enter sonmthing',
hintStyle: TextStyle(color: kHintTextColor,),
contentPadding: EdgeInsets.all(17.0),
enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kWhiteColor, width: 1.0)),
focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPinkColor, width: 1.0)),
);


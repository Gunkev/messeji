import 'package:flutter/material.dart';

class ChatRaisedButton extends StatelessWidget {

  ChatRaisedButton({@required this.colour, this.onPress, this.title, this.padding});

  final Function onPress;
  final  Color colour;
  final title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: colour,
      padding: padding,
      onPressed: onPress,
      child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0)),
    );
  }
}

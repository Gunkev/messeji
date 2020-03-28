import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  static const id = 'chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('this my chat room'),
    );
  }
}

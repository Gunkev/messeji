import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messeji/utilities/const.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {

  static const id = 'chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageEditController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String message;

  initState() {
    super.initState();
    getCurrentUser();
    getMessageStreams();
  }

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if(user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e) {
      print(e);
    }
  }

  void getMessageStreams() async {
     await for(var snapshot in _fireStore.collection('messages').snapshots()) {
       for (var message in snapshot.documents) {
         print(message.data);
       }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: gradientStart,
        title: Text('Chat'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.lockOutline, color: kWhiteColor,),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          )
        ]
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
               MessageStream(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TextField(
                          onChanged: (value) {
                            message = value;
                          },
                          controller: messageEditController,
                          autofocus: false,
                          style: TextStyle(color: Color(0xaaaaaaaa)),
                          decoration: kTextFieldDecoration.copyWith(hintText: 'Text somebody',focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gradientStart, width: 1.0)), ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(EvaIcons.paperPlane, color: gradientStart,),
                      onPressed: () {
                        messageEditController.clear();
                        _fireStore.collection('messages').add({
                          'text': message,
                          'sender': loggedInUser.email
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Center
            (child: CircularProgressIndicator(
            backgroundColor: gradientStart,
          ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageContainer> messageWidgets = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final currentUser = loggedInUser.email;
          final messageWidget = MessageContainer(
            sender: messageSender,
            message: messageText,
            isMe: currentUser == messageSender,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}


class MessageContainer extends StatelessWidget {

  MessageContainer({this.sender, this.message, this.isMe});
  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              sender,
            style: TextStyle(color: gradientStart),
          ),
          SizedBox(height: 10.0),
          Material(
            elevation: 4.00,
            borderRadius: isMe ? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
            ) :
            BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? gradientStart : gradientStop,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                message,
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


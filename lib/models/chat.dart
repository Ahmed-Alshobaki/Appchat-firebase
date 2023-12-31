import 'package:flutter/material.dart';


import '../constants.dart';
import 'message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message1 message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width-MediaQuery.sizeOf(context).width/2
        ),
        padding: EdgeInsets.only(left: 16, top: 25, bottom: 25, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message1,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message1 message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width-MediaQuery.sizeOf(context).width/2
        ),
        padding: const EdgeInsets.only(left: 12, top: 20, bottom: 20, right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message1,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

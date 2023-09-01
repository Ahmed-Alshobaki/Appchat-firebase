import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/chat.dart';

class ChatPage extends StatefulWidget {
   ChatPage({super.key});
  static String id = 'ChatPage';
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  State<ChatPage> createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textField = TextEditingController();
    CollectionReference messages = FirebaseFirestore.instance.collection('messages');
    return FutureBuilder<QuerySnapshot<Object?>>(
      future: messages.get()
      , builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.hasData){
          print(snapshot.data!.docs[0]["message"]);
          return   Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  Text('chat'),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                      ChatBubleForFriend(message: Message("zondfgdffdgrdgfdgdfgfdSgdfgdffdgdfggd","1"),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 10),
                  child: TextField(
                    controller: textField,
                    onSubmitted: (val){
                      messages.add({
                        "message":val.toString()
                      });
                      textField.clear();
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.send),
                        disabledBorder: OutlineInputBorder(

                        ),
                        focusedBorder: OutlineInputBorder(

                        ),
                        enabledBorder: OutlineInputBorder(

                        )
                    ),
                  ),
                )
              ],
            ),
          );
        }else{
         return Scaffold(
           body: Center(child: Text("Loding")),
         );}
        }
    );

  }
}

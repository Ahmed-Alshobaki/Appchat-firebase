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
    List<Message1> messagess = [];
    return FutureBuilder<QuerySnapshot<Object?>>(
      future: messages.get()
      , builder: ( context,  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.hasData){
          for(int i = 0; i < snapshot.data!.docs.length; i++){
            messagess.add(Message1.fromjosn(snapshot.data!.docs[i]));
          }

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
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ( context, int index) {
                    return ChatBubleForFriend(message: messagess[index],);

                  },

                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 10),
                  child: TextField(
                    controller: textField,
                    onSubmitted: (val){

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

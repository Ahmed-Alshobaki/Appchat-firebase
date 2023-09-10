import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/chat.dart';

class ChatPage extends StatefulWidget {

   ChatPage({Key? key}) : super(key: key);
  static String id = 'ChatPage';
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  State<ChatPage> createState() => ChatState();
}

class ChatState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final _controller =ScrollController();
    TextEditingController textField = TextEditingController();
    CollectionReference messages = FirebaseFirestore.instance.collection('messages');
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').snapshots();
    final String email =ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: messages.orderBy("Time",descending: true).snapshots()
      , builder: ( context,  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.hasData){
          List<Message1> messagess = [];
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
                    reverse: true,
                    controller: _controller,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ( context, int index) {
                    return messagess[index].id==email ?  ChatBuble(message: messagess[index],):ChatBubleForFriend(message: messagess[index]);

                  },

                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 10),
                  child: TextField(
                    controller: textField,
                    onSubmitted: (val){
                      messages.add({
                        "messages":val,
                        "Time" :DateTime.now(),
                        "id" : email,
                      });
                      textField.clear();
                      _controller.animateTo(_controller.position.minScrollExtent, duration: Duration(seconds: 3), curve: Curves.fastEaseInToSlowEaseOut);
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

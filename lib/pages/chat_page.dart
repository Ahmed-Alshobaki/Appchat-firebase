import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';
import '../cubit/chat/chat_cubit.dart';
import '../models/chat.dart';
class Chat extends StatelessWidget {
  static String id = 'ChatPage';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final _controller =ScrollController();
    TextEditingController textField = TextEditingController();

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').snapshots();
    final String email =ModalRoute.of(context)!.settings.arguments as String;

    return  BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if(state is Chatsuccess){


        }
  },
  builder: (context, state) {
    return Scaffold(
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
              itemCount: BlocProvider.of<ChatCubit>(context).messagess.length,
              itemBuilder: ( context, int index) {
                return BlocProvider.of<ChatCubit>(context).messagess[index].id==email ?  ChatBuble(message: BlocProvider.of<ChatCubit>(context).messagess[index],):ChatBubleForFriend(message: BlocProvider.of<ChatCubit>(context).messagess[index]);

              },

            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 10),
            child: TextField(
              controller: textField,
              onSubmitted: (val){
                BlocProvider.of<ChatCubit>(context).adddata(email: email, messagess: val);
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
  },
);
  }
}

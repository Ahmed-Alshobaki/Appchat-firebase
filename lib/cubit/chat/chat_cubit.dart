import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  List<Message1> messagess = [];

  adddata({required String email,required String messagess }){
    messages.add({
      "messages":messagess,
      "Time" :DateTime.now(),
      "id" : email,
    });



  }
  getdata(){
    messages.orderBy("Time",descending: true).snapshots().listen((event) {
      messagess.clear();
      for(var doc  in event.docs){
        messagess.add(Message1.fromjosn(doc));
      }

      emit(Chatsuccess());
    }
    );
  }
}

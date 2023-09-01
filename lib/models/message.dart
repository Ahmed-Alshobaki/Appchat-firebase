

// class Message {
//   final String message;
//   final String id;
//   Message(this.message, this.id);
//
// }
class Message1 {
   final String message1;
  Message1(this.message1);
  factory Message1.fromjosn(josn){
      return Message1(josn["messages"]);
  }

}
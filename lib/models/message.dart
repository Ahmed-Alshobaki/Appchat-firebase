

// class Message {
//   final String message;
//   final String id;
//   Message(this.message, this.id);
//
// }
class Message1 {
   final String message1;
    String id;
  Message1(this.message1,this.id);
  factory Message1.fromjosn(josn){
      return Message1(josn["messages"],josn["id"]);
  }

}
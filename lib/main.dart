
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/resgister_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
       LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
       // ChatPage.id : (context) => ChatPage()
      },
      initialRoute: LoginPage.id,
    );
  }
}

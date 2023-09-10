import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/resgister_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/login/login_cubit.dart';
import 'firebase_options.dart';


void main() async {
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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            LoginPageState.id: (context) => LoginPageState(),
            RegisterPage.id: (context) => RegisterPage(),
            ChatPage.id: (context) => ChatPage()
          },
          //initialRoute: LoginPage.id,
          home: FirebaseAuth.instance.currentUser != null ?
          LoginPageState() : ChatPage()


      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Login({required String email,required String password })async{
  try{
    emit(Loginloading());
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    emit(Loginsuccess());
  }on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      emit(LoginReplay(Error: "user-not-found"));
    } else if (e.code == 'wrong-password') {
      emit(LoginReplay(Error: "wrong-password"));
    }
  }

  }
}

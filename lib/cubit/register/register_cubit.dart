import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  Register({required String email,required String password})async {
    try {
      emit(Registerloading());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Registersuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterReplay(Error: "weak-password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterReplay(Error: "email-already-in-use"));
      }
    } catch (e) {
      emit(RegisterReplay(Error: "email-already-in-use"));
    }

  }
}

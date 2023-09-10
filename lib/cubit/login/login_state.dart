part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loginsuccess extends LoginState {}
class LoginReplay extends LoginState {
  String Error ;
  LoginReplay({required this.Error});

}
class Loginloading extends LoginState {}


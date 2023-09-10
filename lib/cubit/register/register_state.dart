part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class Registersuccess extends RegisterState {}
class RegisterReplay extends RegisterState {
  String Error ;
  RegisterReplay({required this.Error});

}
class Registerloading extends RegisterState {}

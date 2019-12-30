import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends SignInState {}

class LoginLoading extends SignInState {}

class LoginFailure extends SignInState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

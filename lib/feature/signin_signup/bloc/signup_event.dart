import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonPressed extends SignUpEvent {
  final String username;
  final String password;
  final String email;

  const SignUpButtonPressed({
    @required this.username,
    @required this.password,
    @required this.email,
  });

  @override
  List<Object> get props => [username, password, email];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password, email: $email }';
}

part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class SignUp extends AuthEvent {
  final String login;
  final String name;
  final String lastName;
  final String password;
  const SignUp({
    required this.login,
    required this.name,
    required this.lastName,
    required this.password,
  });
}

class SignIn extends AuthEvent {
  final String login;

  final String password;
  const SignIn({
    required this.login,
    required this.password,
  });
}

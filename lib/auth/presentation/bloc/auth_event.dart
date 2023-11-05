part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CreateUserWithEmailAndPasswordEvent extends AuthEvent {
  final User user;
  const CreateUserWithEmailAndPasswordEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class AuthLoginWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  const AuthLoginWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

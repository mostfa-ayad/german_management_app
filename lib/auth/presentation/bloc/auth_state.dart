part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UserErrorState extends AuthState {
  final String msg;
  const UserErrorState({
    required this.msg,
  });
}

class UserCreateSuccessState extends AuthState {}

class UserLoginState extends AuthState {}

class UserLogoutState extends AuthState {}

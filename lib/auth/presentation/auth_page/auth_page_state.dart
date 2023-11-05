part of 'auth_page_cubit.dart';

sealed class AuthPageState extends Equatable {
  const AuthPageState();

  @override
  List<Object> get props => [];
}

final class AuthPageInitial extends AuthPageState {}

class AuthPageChangeViewState extends AuthPageState {}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String userName;
  final String password;
  final String email;
  const User({
    required this.id,
    required this.userName,
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [id, userName, password, email];
}

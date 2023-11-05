import 'package:german_management_app/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.userName,
      required super.password,
      required super.email});
}

import 'package:dartz/dartz.dart';
import 'package:german_management_app/auth/domain/entities/user.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUserList();
  Future<FailureOrUnit> createUser(User user);
  Future<FailureOrUnit> updateUser(User user);
  Future<FailureOrUnit> deleteUser(int id);
  Future<FailureOrUnit> createUserWitheEmailAndPassword(User user);
  Future<FailureOrUnit> signout();
  Future<FailureOrUnit> loginWithEmail(String email, String password);
  Future<Either<Failure, bool>> isLogin();
}

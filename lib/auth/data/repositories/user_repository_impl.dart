import 'package:dartz/dartz.dart';

import 'package:german_management_app/auth/data/datasources/user_data_source.dart';
import 'package:german_management_app/auth/data/models/UserModel.dart';
import 'package:german_management_app/auth/domain/entities/user.dart';
import 'package:german_management_app/auth/domain/repositories/user_repository.dart';
import 'package:german_management_app/core/error/exception.dart';
import 'package:german_management_app/core/error/failure.dart';
import 'package:german_management_app/core/my_types.dart';

class UserRepositoryImpl extends UserRepository {
  UserDataSource dataSource;
  UserRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<FailureOrUnit> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<FailureOrUnit> createUserWitheEmailAndPassword(User user) async {
    try {
      await dataSource.createUserWitheEmailAndPassword(UserModel(
          id: user.id,
          userName: user.userName,
          password: user.password,
          email: user.email));
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<FailureOrUnit> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUserList() {
    // TODO: implement getUserList
    throw UnimplementedError();
  }

  @override
  Future<FailureOrUnit> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }

  @override
  Future<FailureOrUnit> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<FailureOrUnit> loginWithEmail(String email, String password) async {
    try {
      await dataSource.loginWithEmail(email, password);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, bool>> isLogin() {
    // TODO: implement isLogin
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:german_management_app/auth/data/models/UserModel.dart';
import 'package:german_management_app/core/error/exception.dart';

abstract class UserDataSource {
  Future<Unit> createUserWitheEmailAndPassword(UserModel user);
  Future<Unit> loginWithEmail(String email, String password);
}

class UserFirebaseDataSource extends UserDataSource {
  @override
  Future<Unit> createUserWitheEmailAndPassword(UserModel user) async {
    var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    if (response.user != null) {
      return Future.value(unit);
    } else {
      throw ServerException(msg: "Error ");
    }
  }

  @override
  Future<Unit> loginWithEmail(String email, String password) async {
    var response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (response.user != null) {
      return Future.value(unit);
    } else {
      throw ServerException(msg: "Error");
    }
  }
}

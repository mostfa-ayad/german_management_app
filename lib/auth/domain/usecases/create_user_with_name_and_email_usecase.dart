import 'package:german_management_app/auth/domain/entities/user.dart';
import 'package:german_management_app/auth/domain/repositories/user_repository.dart';
import 'package:german_management_app/core/my_types.dart';

class CreateUserWithEmailAndPasswordUsecase {
  UserRepository repository;
  CreateUserWithEmailAndPasswordUsecase({
    required this.repository,
  });
  Future<FailureOrUnit> call(User user) {
    return repository.createUserWitheEmailAndPassword(user);
  }
}

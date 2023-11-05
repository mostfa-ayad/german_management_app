import 'package:german_management_app/auth/domain/repositories/user_repository.dart';
import 'package:german_management_app/core/my_types.dart';

class LoginWithEmail {
  UserRepository repository;
  LoginWithEmail({
    required this.repository,
  });
  Future<FailureOrUnit> call(String email, String password) async {
    return repository.loginWithEmail(email, password);
  }
}

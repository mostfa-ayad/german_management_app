import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:german_management_app/auth/domain/entities/user.dart';
import 'package:german_management_app/auth/domain/usecases/create_user_with_name_and_email_usecase.dart';
import 'package:german_management_app/auth/domain/usecases/login_with_email.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  CreateUserWithEmailAndPasswordUsecase createUserWithEmailAndPasswordUsecase;
  LoginWithEmail loginWithEmail;
  AuthBloc({
    required this.createUserWithEmailAndPasswordUsecase,
    required this.loginWithEmail,
  }) : super(AuthInitial()) {
    on<CreateUserWithEmailAndPasswordEvent>((event, emit) async {
      emit(AuthInitial());
      var either = await createUserWithEmailAndPasswordUsecase.call(event.user);
      either.fold((failure) {
        emit(UserErrorState(msg: failure.msg));
      }, (_) => emit(UserCreateSuccessState()));
    });
    on<AuthLoginWithEmailAndPassword>(
      (event, emit) async {
        emit(AuthInitial());
        var either = await loginWithEmail.call(event.email, event.password);
        either.fold((failure) => emit(UserErrorState(msg: failure.msg)),
            (_) => emit(UserLoginState()));
      },
    );
  }
}

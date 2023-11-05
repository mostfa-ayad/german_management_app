import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit() : super(AuthPageInitial());
  bool isLogin = false;
  changeView(bool view) {
    emit(AuthPageInitial());
    isLogin = view;
    emit(AuthPageChangeViewState());
  }
}

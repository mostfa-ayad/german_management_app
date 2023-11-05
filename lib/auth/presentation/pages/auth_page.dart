import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_management_app/auth/domain/entities/user.dart';
import 'package:german_management_app/auth/presentation/auth_page/auth_page_cubit.dart';
import 'package:german_management_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:german_management_app/auth/presentation/widgets/auth_text_field.dart';
import 'package:german_management_app/core/extentions.dart';
import 'package:german_management_app/core/widget/app_snack_bar.dart';

class AuthPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  late AuthPageCubit cubit;
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<AuthPageCubit>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserErrorState) {
          showAppSnackBar(context, state.msg);
        }
        if (state is UserCreateSuccessState) {
          showAppSnackBar(context, "User Create Success");
        }
        if (state is UserLoginState) {
          showAppSnackBar(context, "User Login Success");
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthPageCubit, AuthPageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  title:
                      Text((cubit.isLogin) ? "Login Page" : "Register Page")),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildIcon(context),
                        SizedBox(
                          child: buildFields(),
                        ),
                        buildFooter(context)
                      ]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildIcon(BuildContext context) {
    return Icon(
      Icons.security_outlined,
      size: context.screenHeight * .25,
    );
  }

  Widget buildFooter(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .2,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                if (form.currentState!.validate()) {
                  var user = User(
                      id: 0,
                      userName: userName.text,
                      password: password.text,
                      email: email.text);
                  if (cubit.isLogin) {
                    BlocProvider.of<AuthBloc>(context).add(
                        AuthLoginWithEmailAndPassword(
                            email: email.text, password: password.text));
                  } else {
                    BlocProvider.of<AuthBloc>(context)
                        .add(CreateUserWithEmailAndPasswordEvent(user: user));
                  }
                }
              },
              child: Text((cubit.isLogin) ? "Login" : "Register")),
          InkWell(
            onTap: () {
              cubit.changeView(!cubit.isLogin);
            },
            child: (cubit.isLogin)
                ? const Text("did't have account yet press for create")
                : const Text("have an accout press for Log in"),
          )
        ],
      ),
    );
  }

  Widget buildFields() {
    return Form(
      key: form,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuthTextField(
            text: "email",
            controller: email,
            keyboardType: TextInputType.emailAddress,
          ),
          AuthTextField(
            text: "user Name",
            controller: userName,
            keyboardType: TextInputType.text,
            isVisible: (cubit.isLogin) ? false : true,
          ),
          AuthTextField(
            text: "password",
            isPassword: true,
            controller: password,
            keyboardType: TextInputType.visiblePassword,
          ),
          AuthTextField(
              text: "re-password",
              controller: repassword,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              isVisible: (cubit.isLogin) ? false : true),
        ],
      ),
    );
  }
}

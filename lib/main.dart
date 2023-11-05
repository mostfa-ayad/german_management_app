import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_management_app/auth/presentation/auth_page/auth_page_cubit.dart';
import 'package:german_management_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:german_management_app/auth/presentation/pages/auth_page.dart';
import 'package:german_management_app/home_page.dart';
import 'package:german_management_app/product/presentation/product_bloc/product_bloc.dart';
import 'package:german_management_app/product/presentation/image_cubit/image_cubit_cubit.dart';
import 'firebase_options.dart';
import 'package:german_management_app/core/injection_container.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthPageCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => ImageCubitCubit(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder(
            initialData: FirebaseAuth.instance.currentUser,
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else {
                return AuthPage();
              }
            },
          )),
    );
  }
}

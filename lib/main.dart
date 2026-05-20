import 'package:appmovilejecuciones26_1/bloc/user/user_bloc.dart';
import 'package:appmovilejecuciones26_1/widget/cardStateless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'pages/login_page.dart';
import 'repositories/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Crea le repositorio que conecta el bloc con SQLite
    final userRepository = UserRepository();
    //Provee el loginBloc y le pasa el repositorio
    // return BlocProvider(
    //   create: (_) => LoginBloc(userRepository),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Login Bloc SQLite',
    //     home: const LoginPage(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(userRepository)),
        BlocProvider(create: (_) => UserBloc(userRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}

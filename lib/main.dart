import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/blocs/registrar/registrar_bloc.dart';
import 'package:note_app/blocs/user/user_bloc.dart';
import 'package:note_app/screens/login.dart';
import 'package:note_app/screens/registrar.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegistrarBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (_) => const Login(),
          'registrar': (_) => const Registrar(),
        },
      ),
    );
  }
}

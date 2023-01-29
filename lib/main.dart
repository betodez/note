import 'package:flutter/material.dart';
import 'package:note_app/screens/login.dart';
import 'package:note_app/screens/registrar.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (_) => const Login(),
        'registrar': (_) => const Registrar(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_app/screens/login.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

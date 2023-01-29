import 'package:flutter/material.dart';
import 'package:note_app/widgets/login_header.dart';

class LoginBackground extends StatelessWidget {
  final Widget widget;

  const LoginBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [const LoginHeader(), widget],
    );
  }
}

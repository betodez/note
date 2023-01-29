import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
      child: const SafeArea(
          child: Center(
              child: Text(
        'Inicio de sesión',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ))),
    );
  }
}

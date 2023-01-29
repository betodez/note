import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  const LoginHeader({Key? key, required this.title}) : super(key: key);

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
      child: SafeArea(
          child: Center(
              child: Text(
        title,
        style: const TextStyle(fontSize: 50, color: Colors.white),
      ))),
    );
  }
}

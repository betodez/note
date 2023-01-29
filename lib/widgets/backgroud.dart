import 'package:flutter/material.dart';
import 'package:note_app/widgets/login_header.dart';

class Background extends StatelessWidget {
  final Widget widget;

  final String title;

  const Background({Key? key, required this.widget, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoginHeader(
          title: title,
        ),
        widget
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final IconData? icon;

  const TextFieldCustom({
    Key? key,
    this.icon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
      ),
    );
  }
}

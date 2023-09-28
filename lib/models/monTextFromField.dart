import 'package:flutter/material.dart';

class monTextFromfield extends StatelessWidget {
  const monTextFromfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    this.validator,
  });

  final bool obscureText;

  final String hintText;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 14,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(hintText: hintText),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;
  final String? suffixText;
  final TextInputType? keyboardType;

  const TextFieldProfile({
    super.key,
    required this.controller,
    this.hintText,
    required this.obscureText,
    this.suffixText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixText: suffixText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
    );
  }
}

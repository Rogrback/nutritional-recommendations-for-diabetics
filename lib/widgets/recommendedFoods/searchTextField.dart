import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool? enabled;

  const SearchTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.obscureText,
    this.suffix,
    this.keyboardType,
    this.enabled
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            labelText: 'Ingrese alimento',
            suffix: suffix,
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
      ),
    );
  }
}

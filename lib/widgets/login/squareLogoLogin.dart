import 'package:flutter/material.dart';

class SquareLogoLogin extends StatelessWidget {
  
  final String imagePath;

  const SquareLogoLogin({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 200,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SquareTileLogin extends StatelessWidget {
  
  final String imagePath;

  const SquareTileLogin({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}
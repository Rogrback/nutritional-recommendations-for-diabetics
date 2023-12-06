import 'package:flutter/material.dart';

class TitleTextCard extends StatelessWidget {
  
  final String title;

  const TitleTextCard({
    super.key,
    required this.title
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black87,
      ),
    );
  }
}
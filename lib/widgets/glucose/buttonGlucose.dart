import 'package:flutter/material.dart';

class ButtonGlucose extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const ButtonGlucose({
    super.key,
    required this.onTap,
    required this.text,
  });  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 196, 71),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}
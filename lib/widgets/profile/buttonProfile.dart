import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const ButtonProfile({
    super.key,
    required this.onTap,
    required this.text,
  });  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        padding: const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
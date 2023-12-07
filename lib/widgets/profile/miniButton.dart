import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {

  final Function()? onPressed;
  final String text;

  const MiniButton({
    super.key,
    required this.onPressed,
    required this.text,
  });  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        padding: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
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
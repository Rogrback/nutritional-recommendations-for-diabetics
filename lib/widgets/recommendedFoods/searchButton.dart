import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {

  final Function()? onPressed;
  final String text;

  const SearchButton({
    super.key,
    required this.onPressed,
    required this.text
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(widget.text)
    );
  }
}
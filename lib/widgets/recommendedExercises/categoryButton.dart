import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {

  final String categoryName;
  final void Function()? onTap;

  const CategoryButton({
    super.key,
    required this.categoryName,  
    required this.onTap
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 170, 113),
        border: Border.all(
          color: const Color.fromARGB(255, 37, 170, 113)
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
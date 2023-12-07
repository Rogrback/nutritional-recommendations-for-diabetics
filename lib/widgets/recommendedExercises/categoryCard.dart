import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {

  final String nameCategory;

  const CategoryCard({
    super.key,
    required this.nameCategory
    });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Entrando a ${widget.nameCategory}");
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF43e5a0),
                Color(0xFFb8fadd),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 2
            )
          ),
          alignment: Alignment.center,
          height: 100,
          width: 300,
          child: Text(
            widget.nameCategory,
            style: const TextStyle(fontSize: 20),
          ),
      ),
    );
  }
}
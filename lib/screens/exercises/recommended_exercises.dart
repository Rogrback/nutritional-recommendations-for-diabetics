import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class RecommendedExercisesScreen extends StatefulWidget {
  const RecommendedExercisesScreen({super.key});

  @override
  State<RecommendedExercisesScreen> createState() => _RecommendedExercisesScreenState();
}

class _RecommendedExercisesScreenState extends State<RecommendedExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          CategoryCard(nameCategory: "Ejercicios básicos"),
          SizedBox(height: 50),
          CategoryCard(nameCategory: "Ejercicios intermedios"),
          SizedBox(height: 50),
          CategoryCard(nameCategory: "Ejercicios avanzados"),
        ],
      ),
    );
  }
}
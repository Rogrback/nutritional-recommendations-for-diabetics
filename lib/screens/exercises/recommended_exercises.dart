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
        children: [
          // ListView.builder(
          //   itemCount: 1000,
          //   // shrinkWrap: true,
          //   itemBuilder: (context, index){
          //     return Container(
          //       height: 150,
          //       color: Colors.primaries[index % Colors.primaries.length],
          //       child: FittedBox(
          //         child: Text('Ejercicio $index'),
          //       ),
          //     );
          //   },          
          // ),
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
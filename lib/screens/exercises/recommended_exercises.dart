import 'package:flutter/material.dart';

class RecommendedExercisesScreen extends StatefulWidget {
  const RecommendedExercisesScreen({super.key});

  @override
  State<RecommendedExercisesScreen> createState() => _RecommendedExercisesScreenState();
}

class _RecommendedExercisesScreenState extends State<RecommendedExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1000,
        // shrinkWrap: true,
        itemBuilder: (context, index){
          return Container(
            height: 150,
            color: Colors.primaries[index % Colors.primaries.length],
            child: FittedBox(
              child: Text('Ejercicio $index'),
            ),
          );
        },
      ),
    );
  }
}
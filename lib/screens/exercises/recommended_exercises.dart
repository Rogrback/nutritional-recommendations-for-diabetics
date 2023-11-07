import 'package:flutter/material.dart';

class recommendedExercisesScreen extends StatefulWidget {
  const recommendedExercisesScreen({super.key});

  @override
  State<recommendedExercisesScreen> createState() => _recommendedExercisesScreenState();
}

class _recommendedExercisesScreenState extends State<recommendedExercisesScreen> {
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
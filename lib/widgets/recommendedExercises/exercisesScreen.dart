import 'package:flutter/material.dart';
import 'package:tesis_project_v1/infrastructure/models/exerciseRoutine.dart';

class ExercisesScreen extends StatelessWidget {
  final List<ExerciseRoutine> exerciseRoutines;

  const ExercisesScreen({Key? key, required this.exerciseRoutines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutinas de Ejercicio'),
      ),
      body: ListView.builder(
        itemCount: exerciseRoutines.length,
        itemBuilder: (context, index) {
          final routine = exerciseRoutines[index];
          return ListTile(
            title: Container(
              decoration: const BoxDecoration(
                color: Colors.green
              ),
              child: Text(
                routine.routineName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: routine.routineSteps
                  .map((step) => ListTile(
                        title: Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber
                          ),
                          child: Text('Paso ${step.stepNumber}')
                        ),
                        subtitle: Text(step.stepDescription),
                        // leading: Image.network(step.stepImage), // Mostrar la imagen desde la URL
                        leading: Text(step.stepImage), 
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

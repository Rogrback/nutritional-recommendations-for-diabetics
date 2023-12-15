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
            title: Text(routine.routineName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: routine.routineSteps
                  .map((step) => ListTile(
                        title: Text('Paso ${step.stepNumber}'),
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

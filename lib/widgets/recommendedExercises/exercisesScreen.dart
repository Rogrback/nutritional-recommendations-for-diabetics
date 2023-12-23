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
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
      ),
      body: ListView.builder(
        itemCount: exerciseRoutines.length,
        itemBuilder: (context, index) {
          final routine = exerciseRoutines[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  routine.routineName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: routine.routineSteps
                    .map((step) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paso ${step.stepNumber}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 30
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.network(
                                step.stepImage,
                                width: 450,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                step.stepDescription,
                                style: const TextStyle(
                                  fontSize: 25
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const Divider(), // Añadir un divisor entre las rutinas
            ],
          );
        },
      ),
    );
  }
}

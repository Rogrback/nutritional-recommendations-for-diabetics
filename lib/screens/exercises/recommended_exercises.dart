import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tesis_project_v1/infrastructure/models/exerciseRoutine.dart'; // Asegúrate de importar el archivo correcto
import 'package:tesis_project_v1/screens/main.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class RecommendedExercisesScreen extends StatefulWidget {
  const RecommendedExercisesScreen({Key? key}) : super(key: key);

  @override
  _RecommendedExercisesScreenState createState() => _RecommendedExercisesScreenState();
}

class _RecommendedExercisesScreenState extends State<RecommendedExercisesScreen> {

  late List<ExerciseRoutine> exerciseRoutines = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data_exercises.json');
      exerciseRoutines = exerciseRoutineFromJson(jsonString);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error cargando y decodificando el JSON: $e');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ExercisesScreen(exerciseRoutines: exerciseRoutines);
  // }

  void enterRoutine () {
    print('Probando rutina');
  }

  void enterRoutinee () {
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => ExercisesScreen(exerciseRoutines: exerciseRoutines),
     )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CategoryButton(
            categoryName: 'RUTINA LIGERA DE EJERCICIO',
            onTap: enterRoutinee,
          ),
          CategoryButton(
            categoryName: 'RUTINA DE INTENSIDAD MODERADA',
            onTap: () {}
          ),
          CategoryButton(
            categoryName: 'RUTINA DE INTENSIDAD VIGOROSA',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

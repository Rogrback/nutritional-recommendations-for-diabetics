import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tesis_project_v1/infrastructure/models/exerciseRoutine.dart'; // Asegúrate de importar el archivo correcto
import 'package:tesis_project_v1/widgets/main.dart';

class RecommendedExercisesScreen extends StatefulWidget {
  const RecommendedExercisesScreen({Key? key}) : super(key: key);

  @override
  _RecommendedExercisesScreenState createState() => _RecommendedExercisesScreenState();
}

class _RecommendedExercisesScreenState extends State<RecommendedExercisesScreen> {

  // late List<ExerciseRoutine> exerciseRoutines = [];
  List<ExerciseRoutine> lightRoutines = [];
  List<ExerciseRoutine> moderateRoutines = [];
  List<ExerciseRoutine> vigorousRoutines = [];

  @override
  void initState() {
    super.initState();
    // _loadExercises();
    _loadLightExercises();
    _loadModerateExercises();
    _loadVigorousExercises();
  }

  // Future<void> _loadExercises() async {
  //   try {
  //     String jsonString = await rootBundle.loadString('assets/data_exercises.json');
  //     exerciseRoutines = exerciseRoutineFromJson(jsonString);
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     print('Error cargando y decodificando el JSON: $e');
  //   }
  // }

  Future<void> _loadLightExercises() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data_exercises1.json');
      lightRoutines = exerciseRoutineFromJson(jsonString);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error cargando y decodificando el JSON: $e');
    }
  }

  Future<void> _loadModerateExercises() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data_exercises2.json');
      moderateRoutines = exerciseRoutineFromJson(jsonString);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error cargando y decodificando el JSON: $e');
    }
  }

  Future<void> _loadVigorousExercises() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data_exercises3.json');
      vigorousRoutines = exerciseRoutineFromJson(jsonString);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error cargando y decodificando el JSON: $e');
    }
  }

  // void enterRoutine () {
  //   print('Probando rutina');
  // }

  // void enterRoutinee () {
  //   Navigator.of(context).push(
  //    MaterialPageRoute(
  //      builder: (_) => ExercisesScreen(exerciseRoutines: exerciseRoutines),
  //    )
  //   );
  // }

  void lightRoutine () {
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => ExercisesScreenn(exerciseRoutines: lightRoutines),
     )
    );
  }

  void moderateRoutine () {
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => ExercisesScreenn(exerciseRoutines: moderateRoutines),
     )
    );
  }

  void vigorousRoutine () {
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => ExercisesScreenn(exerciseRoutines: vigorousRoutines),
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
            // onTap: enterRoutinee,
            onTap: lightRoutine,
          ),
          CategoryButton(
            categoryName: 'RUTINA DE INTENSIDAD MODERADA',
            // onTap: enterRoutinee,
            onTap: moderateRoutine,
          ),
          CategoryButton(
            categoryName: 'RUTINA DE INTENSIDAD VIGOROSA',
            // onTap: enterRoutinee,
            onTap: vigorousRoutine,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ExerciseCardio extends StatefulWidget {
  const ExerciseCardio({super.key});

  @override
  State<ExerciseCardio> createState() => _ExerciseCardioState();
}

class _ExerciseCardioState extends State<ExerciseCardio> {



  // void swimmingList () {
  //   Navigator.of(context).push(
  //    MaterialPageRoute(
  //     //  builder: (_) => ExercisesScreenn(exerciseRoutines: vigorousRoutines),
  //      builder: (_) => () ,
  //    )
  //   );
  // }

  // void athleticsList () {
  //   Navigator.of(context).push(
  //    MaterialPageRoute(
  //     //  builder: (_) => ExercisesScreenn(exerciseRoutines: vigorousRoutines),
  //      builder: (_) => () ,
  //    )
  //   );
  // }

  // void cyclingList () {
  //   Navigator.of(context).push(
  //    MaterialPageRoute(
  //     //  builder: (_) => ExercisesScreenn(exerciseRoutines: vigorousRoutines),
  //      builder: (_) => () ,
  //    )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardioScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryButton(
              categoryName: 'NATACION',
              onTap: () {},
              // onTap: swimmingList,
            ),
            CategoryButton(
              categoryName: 'ATLETISMO',
              onTap: () {},
              // onTap: athleticsList,
            ),
            CategoryButton(
              categoryName: 'CICLISMO',
              onTap: () {},
              // onTap: cyclingList,
            ),
          ],
        ),
      ),
    );
  }
}
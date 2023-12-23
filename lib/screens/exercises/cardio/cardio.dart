import 'package:flutter/material.dart';
import 'package:tesis_project_v1/infrastructure/models/exerciseCardio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:tesis_project_v1/widgets/recommendedExercises/cardioScreen.dart';

class Cardio extends StatefulWidget {
  const Cardio({super.key});

  @override
  State<Cardio> createState() => _CardioState();
}

class _CardioState extends State<Cardio> {

  void athleticsList () async {
    String jsonString = await rootBundle.loadString('assets/athletics/data_athletics.json');
    ExerciseCardio exerciseCardio = exerciseCardioFromJson(jsonString);
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => CardioScreen(
        exerciseCardio: exerciseCardio,
        imageWidth: 320.0,
        imageHeight: 280.0
      ),
     )
    );
  }  

  void cyclingList () async {
    String jsonString = await rootBundle.loadString('assets/cycling/data_cycling.json');
    ExerciseCardio exerciseCardio = exerciseCardioFromJson(jsonString);
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => CardioScreen(
        exerciseCardio: exerciseCardio,
        imageWidth: 320.0,
        imageHeight: 220.0
      ),
     )
    );
  }

  void swimmingList () async {
    String jsonString = await rootBundle.loadString('assets/swimming/data_swimming.json');
    ExerciseCardio exerciseCardio = exerciseCardioFromJson(jsonString);
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (_) => CardioScreen(
        exerciseCardio: exerciseCardio,
        imageWidth: 320.0,
        imageHeight: 220.0
      ),
     )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardioScreen'),
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryButton(
              categoryName: 'NATACION',
              onTap: swimmingList,
            ),
            CategoryButton(
              categoryName: 'ATLETISMO',
              onTap: athleticsList,
            ),
            CategoryButton(
              categoryName: 'CICLISMO',
              onTap: cyclingList,
            ),
          ],
        ),
      ),
    );
  }
}
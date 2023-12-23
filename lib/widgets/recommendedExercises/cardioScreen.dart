import 'package:flutter/material.dart';
import 'package:tesis_project_v1/infrastructure/models/exerciseCardio.dart';

class CardioScreen extends StatelessWidget {
  final ExerciseCardio exerciseCardio;
  final double imageWidth;
  final double imageHeight;

  const CardioScreen({
    Key? key,
    required this.exerciseCardio,
    required this.imageWidth,
    required this.imageHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseCardio.cardioName),
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
      ),
      body: ListView.builder(
        itemCount: exerciseCardio.cardioSteps.length,
        itemBuilder: (context, index) {
          final step = exerciseCardio.cardioSteps[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paso ${step.stepNumber}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  step.stepTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                step.stepImage.isNotEmpty
                  ? Center(
                      child: Image.network(
                        step.stepImage,
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
                const SizedBox(height: 8),
                Text(
                  step.stepDescription,
                  style: const TextStyle(
                    fontSize: 16
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

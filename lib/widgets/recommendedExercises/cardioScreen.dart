// import 'package:flutter/material.dart';
// import 'package:tesis_project_v1/infrastructure/models/exerciseCardio.dart';

// class CardioScreen extends StatelessWidget {
//   final ExerciseCardio exerciseCardio;

//   const CardioScreen({Key? key, required this.exerciseCardio}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rutinas de Ejercicio'),
//       ),
//       body: ListView.builder(
//         itemCount: exerciseCardio.length,
//         itemBuilder: (context, index) {
//           final cardioRoutine = exerciseCardio[index];
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   // cardioRoutine.cardioName,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: cardioRoutine.cardioSteps
//                     .map((step) => Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 'Paso ${step.stepNumber}',
//                                 textAlign: TextAlign.start,
//                                 style: const TextStyle(
//                                   fontSize: 30,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               Image.network(
//                                 step.stepImage,
//                                 width: 450,
//                                 height: 160,
//                                 fit: BoxFit.cover,
//                               ),
//                               const SizedBox(height: 20),
//                               Text(
//                                 step.stepDescription,
//                                 style: const TextStyle(
//                                   fontSize: 25,
//                                 ),
//                                 textAlign: TextAlign.justify,
//                               ),
//                             ],
//                           ),
//                         ))
//                     .toList(),
//               ),
//               const Divider(), // Añadir un divisor entre las rutinas
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

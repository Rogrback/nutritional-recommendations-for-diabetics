// To parse this JSON data, do
//
//     final exerciseRoutine = exerciseRoutineFromJson(jsonString);

import 'dart:convert';

List<ExerciseRoutine> exerciseRoutineFromJson(String str) => List<ExerciseRoutine>.from(json.decode(str).map((x) => ExerciseRoutine.fromJson(x)));

String exerciseRoutineToJson(List<ExerciseRoutine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExerciseRoutine {
    final String routineName;
    final List<RoutineStep> routineSteps;

    ExerciseRoutine({
        required this.routineName,
        required this.routineSteps,
    });

    factory ExerciseRoutine.fromJson(Map<String, dynamic> json) => ExerciseRoutine(
        routineName: json["routineName"],
        routineSteps: List<RoutineStep>.from(json["routineSteps"].map((x) => RoutineStep.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "routineName": routineName,
        "routineSteps": List<dynamic>.from(routineSteps.map((x) => x.toJson())),
    };
}

class RoutineStep {
    final int stepNumber;
    final String stepDescription;
    final String stepImage;

    RoutineStep({
        required this.stepNumber,
        required this.stepDescription,
        required this.stepImage,
    });

    factory RoutineStep.fromJson(Map<String, dynamic> json) => RoutineStep(
        stepNumber: json["stepNumber"],
        stepDescription: json["stepDescription"],
        stepImage: json["stepImage"],
    );

    Map<String, dynamic> toJson() => {
        "stepNumber": stepNumber,
        "stepDescription": stepDescription,
        "stepImage": stepImage,
    };
}

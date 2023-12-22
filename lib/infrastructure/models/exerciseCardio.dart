import 'dart:convert';

ExerciseCardio exerciseCardioFromJson(String str) => ExerciseCardio.fromJson(json.decode(str));

String exerciseCardioToJson(ExerciseCardio data) => json.encode(data.toJson());

class ExerciseCardio {
    final String cardioName;
    final List<CardioStep> cardioSteps;

    ExerciseCardio({
        required this.cardioName,
        required this.cardioSteps,
    });

    factory ExerciseCardio.fromJson(Map<String, dynamic> json) => ExerciseCardio(
        cardioName: json["cardioName"],
        cardioSteps: List<CardioStep>.from(json["cardioSteps"].map((x) => CardioStep.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cardioName": cardioName,
        "cardioSteps": List<dynamic>.from(cardioSteps.map((x) => x.toJson())),
    };
}

class CardioStep {
    final int stepNumber;
    final String stepTitle;
    final String stepDescription;
    final String stepImage;

    CardioStep({
        required this.stepNumber,
        required this.stepTitle,
        required this.stepDescription,
        required this.stepImage,
    });

    factory CardioStep.fromJson(Map<String, dynamic> json) => CardioStep(
        stepNumber: json["stepNumber"],
        stepTitle: json["stepTitle"],
        stepDescription: json["stepDescription"],
        stepImage: json["stepImage"],
    );

    Map<String, dynamic> toJson() => {
        "stepNumber": stepNumber,
        "stepTitle": stepTitle,
        "stepDescription": stepDescription,
        "stepImage": stepImage,
    };
}

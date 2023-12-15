// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
    final List<Rutina> rutinas;

    Food({
        required this.rutinas,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        rutinas: List<Rutina>.from(json["rutinas"].map((x) => Rutina.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rutinas": List<dynamic>.from(rutinas.map((x) => x.toJson())),
    };
}

class Rutina {
    final String nombre;
    final List<Paso> pasos;

    Rutina({
        required this.nombre,
        required this.pasos,
    });

    factory Rutina.fromJson(Map<String, dynamic> json) => Rutina(
        nombre: json["nombre"],
        pasos: List<Paso>.from(json["pasos"].map((x) => Paso.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "pasos": List<dynamic>.from(pasos.map((x) => x.toJson())),
    };
}

class Paso {
    final int numeroPaso;
    final String descripcion;
    final String imagen;

    Paso({
        required this.numeroPaso,
        required this.descripcion,
        required this.imagen,
    });

    factory Paso.fromJson(Map<String, dynamic> json) => Paso(
        numeroPaso: json["numero_paso"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "numero_paso": numeroPaso,
        "descripcion": descripcion,
        "imagen": imagen,
    };
}

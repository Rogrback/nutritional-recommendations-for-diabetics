import 'package:flutter/material.dart';

class GlucoseCard extends StatelessWidget {
  final String level;
  final String date;
  final String time;

  GlucoseCard({required this.level, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text('Nivel de Glucosa: $level'),
        subtitle: Text('Fecha: $date, Hora: $time'),
      ),
    );
  }
}

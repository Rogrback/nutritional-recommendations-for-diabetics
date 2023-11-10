import 'package:flutter/material.dart';

class StatisticsGlucoseScreen extends StatefulWidget {
  const StatisticsGlucoseScreen({super.key});

  @override
  State<StatisticsGlucoseScreen> createState() => _StatisticsGlucoseScreenState();
}

class _StatisticsGlucoseScreenState extends State<StatisticsGlucoseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Estadística de Registros de Glucosa')
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CalendarGlucoseScreen extends StatefulWidget {
  const CalendarGlucoseScreen({super.key});

  @override
  State<CalendarGlucoseScreen> createState() => _CalendarGlucoseScreenState();
}

class _CalendarGlucoseScreenState extends State<CalendarGlucoseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Calendario de Registros de Glucosa')
        ),
      ),
    );
  }
}
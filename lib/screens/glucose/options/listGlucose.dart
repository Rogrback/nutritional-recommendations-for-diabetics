import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ListGlucoseScreen extends StatefulWidget {
  const ListGlucoseScreen({super.key});

  @override
  State<ListGlucoseScreen> createState() => _ListGlucoseScreenState();
}

class _ListGlucoseScreenState extends State<ListGlucoseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          // child: NoRegisters()
          child: Registers(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2.2,
        child: const Icon(Icons.add),
      ),
    );
  }
}
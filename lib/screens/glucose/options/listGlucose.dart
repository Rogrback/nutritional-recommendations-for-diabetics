import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:tesis_project_v1/screens/main.dart';

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
          child: DataGlucose(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        onPressed: () {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const GlucoseScreen(),
            )
           );
        },
        elevation: 2.2,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );    
  }
}
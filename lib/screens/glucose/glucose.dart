import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/login/mytextfield.dart';

class glucoseScreen extends StatefulWidget {
  const glucoseScreen({super.key});

  @override
  State<glucoseScreen> createState() => _glucoseScreenState();
}

class _glucoseScreenState extends State<glucoseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SafeArea(
          child: Row(
            children: [
              Text(
                'Fecha',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 25,
                ),
              ),
              // MyTextField(
              //   controller: ,
              //   hi
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
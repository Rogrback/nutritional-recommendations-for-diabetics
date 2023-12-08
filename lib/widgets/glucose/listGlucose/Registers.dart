import 'package:flutter/material.dart';

class Registers extends StatelessWidget {

  final int glucose;
  final String medicationMoment;
  final String date;
  final String time;


  const Registers({
    super.key,
    required this.glucose,
    required this.medicationMoment,
    required this.date,
    required this.time
    });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Nivel de Glucosa (mg/dL)',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$glucose',
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Momento de medición',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            medicationMoment,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$date $time',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.grey) 
        ],
      ),
    );
  }
}
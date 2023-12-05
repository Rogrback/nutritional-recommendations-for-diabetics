import 'package:flutter/material.dart';

class SubtitleTextCards extends StatelessWidget {
  final String propertyEs;
  final String propertyEn;
  final String unit;

  const SubtitleTextCards({
    super.key,
    required this.propertyEs,
    required this.propertyEn,
    required this.unit
  });

  @override
  Widget build(BuildContext context) {
    return Text('$propertyEs: $propertyEn $unit',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                );
  }
}
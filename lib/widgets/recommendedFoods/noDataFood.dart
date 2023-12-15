import 'package:flutter/material.dart';

class NoDataFood extends StatelessWidget {
  const NoDataFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        textAlign: TextAlign.center,
        'Ingrese datos en el buscador',
        style: TextStyle(
          fontSize: 20
        ),
      ),
    );
  }
}
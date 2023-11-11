import 'package:flutter/material.dart';

class NoRegisters extends StatelessWidget {
  const NoRegisters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sin Registros',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue.shade600)
              ),
              const SizedBox(height: 22),
              const Text(
                'Para agregar registros de control de glucosa',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22)
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'presione el botón de',
                    style: TextStyle(fontSize: 22)
                  ),
                  Text(
                    ' (+)',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                  )
                ],
              )
            ],
          );
  }
}
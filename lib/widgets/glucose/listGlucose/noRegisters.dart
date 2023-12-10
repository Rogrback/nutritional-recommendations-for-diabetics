import 'package:flutter/material.dart';

class NoRegisters extends StatelessWidget {
  const NoRegisters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sin Registros',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 49, 177, 87))
              ),
              SizedBox(height: 22),
              Text(
                'Para agregar registros de control de glucosa',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22)
              ),
              Row(
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
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registers extends StatefulWidget {

  final int glucose;
  final String medicationMoment;
  final String date;
  final String? time;
  final String? documentId;

  const Registers({
    super.key,
    required this.glucose,
    required this.medicationMoment,
    required this.date,
    this.time,
    this.documentId,
  });

  @override
  State<Registers> createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {

  // late final CollectionReference<Map<String, dynamic>> glucoseCollection;

  void deleteRegister() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!.email;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Registro'),
          content: const Text('¿Estás seguro de que deseas eliminar este registro?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancelar la acción de eliminar
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                // Lógica para eliminar el registro de Firestore si el documentId no es nulo
                if (widget.documentId != null) {
                  final glucoseCollection = db.collection("profile").doc(user).collection("glucose").doc(widget.documentId!);
                  await glucoseCollection.delete();
                  print("Registro eliminado en if");
                }
                print("Registro eliminado en no if");
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  // void deleteRegister () {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Eliminar Registro'),
  //         content: const Text('¿Estás seguro de que deseas eliminar este registro?'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               // Cancelar la acción de eliminar
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancelar'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Lógica para eliminar el registro aquí
  //               // ...
  //               // Cerrar el diálogo
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Eliminar'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
              '${widget.glucose}',
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
            widget.medicationMoment,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.date} ${widget.time}',
                style: const TextStyle(fontSize: 18),
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: IconButton(
                  onPressed: deleteRegister,
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Divider(height: 20, color: Colors.green[800]) 
        ],
      ),
    );
  }
}
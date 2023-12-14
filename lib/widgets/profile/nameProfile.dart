import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NameProfile extends StatelessWidget {
  const NameProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.email;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("profile").doc(user);

    return FutureBuilder<DocumentSnapshot>(
      future: docRef.get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); 
        }

        if (snapshot.hasError) {
          return Text("Error obteniendo el documento: ${snapshot.error}");
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("No se encontraron datos");
        }

        final name = snapshot.data!["name"];

        return Text(
          name.isEmpty ? "Usuario" : name,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        );
      },
    );
  }
}

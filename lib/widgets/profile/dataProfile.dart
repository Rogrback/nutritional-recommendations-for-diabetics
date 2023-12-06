import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataProfile extends StatefulWidget {
  const DataProfile({Key? key}) : super(key: key);

  @override
  State<DataProfile> createState() => _DataProfileState();
}

class _DataProfileState extends State<DataProfile> {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;
  late final CollectionReference<Map<String, dynamic>> profileCollection;

  @override
  void initState() {
    super.initState();
    profileCollection = db.collection("profile");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: profileCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No hay registros');
        }

        // Solo hay una colección, así que obtenemos el primer documento directamente
        var profileDoc = snapshot.data!.docs.first;
        var profileData = profileDoc.data();
        var name = profileData['name'];

        return Text(
          '$name',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 116, 209, 11)
          ),
        );
      },
    );
  }
}

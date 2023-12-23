import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class DataGlucose extends StatefulWidget {
  const DataGlucose({super.key});

  @override
  State<DataGlucose> createState() => _DataGlucoseState();
}

class _DataGlucoseState extends State<DataGlucose> {

  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;
  late final CollectionReference<Map<String, dynamic>> glucoseCollection;
  
  @override
  void initState() { 
    super.initState();
    glucoseCollection = db.collection("profile").doc(user).collection("glucose");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: glucoseCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        // Verifica si hay datos en la subcolección "glucose"
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const NoRegisters();
        }
        // Mapea los documentos de la subcolección a un ListView
        var glucoseDocs = snapshot.data!.docs;
        var glucoseList = glucoseDocs.map((doc) {
          var glucoseData = doc.data();
          var glucose = glucoseData['glucose'];
          var date = glucoseData['date'];
          var medicationMoment = glucoseData['medication_moment'];
          var time = glucoseData['time'];
          var documentId = doc.id;

          return Registers(
            glucose: glucose,
            medicationMoment: medicationMoment,
            date: date,
            time: time,
            documentId: documentId,
          );
        }).toList();

        return ListView(
          children: glucoseList,
        );
      },
    );
  }
}
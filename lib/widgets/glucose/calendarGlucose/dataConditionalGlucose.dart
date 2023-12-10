import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class DataConditionalGlucose extends StatefulWidget {

  final int month;
  final int year;

  const DataConditionalGlucose({
    super.key,
    required this.month,
    required this.year
  });

  @override
  State<DataConditionalGlucose> createState() => _DataConditionalGlucoseState();
}

class _DataConditionalGlucoseState extends State<DataConditionalGlucose> {

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

    int? recordMonth;
    int? recordYear;
    int shortYear;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: glucoseCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var glucoseDocs = snapshot.data!.docs;
        var glucoseList = glucoseDocs.map((doc) {
          var glucoseData = doc.data();
          var glucose = glucoseData['glucose'];
          var date = glucoseData['date'];
          var medicationMoment = glucoseData['medication_moment'];
          var time = glucoseData['time'];

          recordMonth = int.parse(date.substring(3, 5));
          shortYear = int.parse(date.substring(6, 8));
          recordYear = 2000 + shortYear;

          return Registers(
            glucose: glucose,
            medicationMoment: medicationMoment,
            date: date,
            time: time,
          );
        }).toList();

        var filteredGlucoseList = glucoseList.where((record) {
          return recordMonth == widget.month && recordYear == widget.year;
        }).toList();

        if (filteredGlucoseList.isEmpty) {
          return const Center(
            child: Text(
              'No hay datos disponibles en este mes.',
              style: TextStyle(fontSize: 22)
            ));
        }

        return ListView(
          children: filteredGlucoseList,
        );
      },
    );
  }
}
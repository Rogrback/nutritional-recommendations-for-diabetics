// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tesis_project_v1/widgets/glucose/listGlucose/glucoseCard.dart';

// class GlucoseList extends StatefulWidget {
//   @override
//   State<GlucoseList> createState() => _GlucoseListState();
// }

// class _GlucoseListState extends State<GlucoseList> {

//   // var db = FirebaseFirestore.instance;
//   // final glucose = db.collection('glucose');

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('glucose_records').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         // var glucoseData = snapshot.data.docs;
//         var glucoseData = snapshot.data.docs;

//         List<Widget> glucoseCards = [];
//         for (var glucose in glucoseData) {
//           var glucoseRecord = glucose.data();
//           var glucoseCard = GlucoseCard(
//             level: glucoseRecord['glucose_level'],
//             date: glucoseRecord['date'],
//             time: glucoseRecord['time'],
//           );
//           glucoseCards.add(glucoseCard);
//         }

//         return ListView(
//           children: glucoseCards,
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          var glucoseData = doc.data() as Map<String, dynamic>;
          var glucose = glucoseData['glucose'];
          var date = glucoseData['date'];
          var medicationMoment = glucoseData['medication_moment'];

          return Registers(
            glucose: glucose,
            medicationMoment: medicationMoment,
            date: date
          );
        }).toList();

        return ListView(
          children: glucoseList,
        );
      },
    );
  }
}
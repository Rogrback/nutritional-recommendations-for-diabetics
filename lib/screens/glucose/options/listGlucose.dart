import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:tesis_project_v1/screens/main.dart';

class ListGlucoseScreen extends StatefulWidget {
  const ListGlucoseScreen({super.key});

  @override
  State<ListGlucoseScreen> createState() => _ListGlucoseScreenState();
}

class _ListGlucoseScreenState extends State<ListGlucoseScreen> {

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // getGlucoses();
  }  

  void getGlucoses() async {
    CollectionReference collectionReference =
      db.collection("glucose");

    QuerySnapshot glucoses = await collectionReference.get();

    if(glucoses.docs != 0) {
      for(var doc in glucoses.docs) {
        print(doc.data()); 
      }
    }
  }

  final newGlucose = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  
  void setGlucose() {
    FirebaseFirestore.instance.collection("glucose").add(newGlucose).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: DataGlucose(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 37, 196, 71),
        onPressed: () {
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const GlucoseScreen(),
            )
           );
        },
        elevation: 2.2,
        child: const Icon(Icons.add),
      ),
    );    
  }
}
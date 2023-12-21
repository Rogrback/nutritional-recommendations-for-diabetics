import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';  

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({super.key});

  @override
  State<GlucoseScreen> createState() => _GlucoseScreenState();
}

class _GlucoseScreenState extends State<GlucoseScreen> {

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final momentController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  String dropdownValue = "Ayuno";

  List<String> list = <String>[
    "Ayuno",
    "Desayuno",
    "Almuerzo",
    "Cena"
  ];

  void saveGlucose(){
    final user = FirebaseAuth.instance.currentUser!.email;
    final newGlucose = <String, dynamic>{
      "date": _dateController.text,
      "time": _timeController.text,
      "medication_moment": dropdownValue,
      "glucose": int.parse(_glucoseController.text)
    };
    
    _db.collection("profile").doc(user).collection("glucose").add(newGlucose).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));
    // Clean form glucose
    _dateController.clear();
    _timeController.clear();
    _glucoseController.clear();
    // Restart dropdown's first value
    setState(() {
      dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        actions: const [
          SizedBox(width: 45)
        ],
        title: const Center(
          child: Text('Registro de Glucosa'),
        )
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Fecha: ',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DateTextFieldGlucose(
                        controller: _dateController,
                        obscureText: false
                      ),
                    ),                                 
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Hora: ',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TimeTextFieldGlucose(
                        controller: _timeController,
                        obscureText: false
                      ),
                    ),                                 
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                     const Expanded(
                      flex: 2,
                      child: Text(
                        'Momento de medición: ',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade200
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.grey.shade200,
                          isExpanded: true,
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 16,
                          underline: Container(
                            height: 0,
                          ),
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                    ),                  
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Glucosa: ',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFieldGlucose(
                        controller: _glucoseController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        suffix: const Text('mg/dL'),
                      ),
                    ),                  
                  ],
                ),
              ),
              const SizedBox(height: 100),
              ButtonGlucose(
                text: 'Guardar',
                onTap: saveGlucose
              ),
            ],              
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:timezone/timezone.dart' as tz;

  

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({super.key});

  @override
  State<GlucoseScreen> createState() => _GlucoseScreenState();
}

class _GlucoseScreenState extends State<GlucoseScreen> {

  final user = FirebaseAuth.instance.currentUser!.email;
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final momentController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  String dropdownValue = "Desayuno";

  List<String> list = <String>[
    "Desayuno",
    "Almuerzo",
    "Cena"
  ];

  void saveGlucose(){
    final newGlucose = <String, dynamic>{
      "date": _dateController.text,
      "time": _timeController.text,
      "medication_moment": dropdownValue,
      "glucose": int.parse(_glucoseController.text)
    };
    
    _db.collection("profile").doc(user).collection("glucose").add(newGlucose).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));

    print(_dateController.text);
    print(_timeController.text);
    print(dropdownValue);
    print(_glucoseController.text);
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

    var limaLocation = tz.getLocation('America/Lima');
    var nowInLima = tz.TZDateTime.now(limaLocation);
    final formattedDate = DateFormat("dd-MM-yy hh:mm a").format(nowInLima);
    print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ  $formattedDate');

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Center(
          child: Text('Glucosa'),
        )
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SafeArea(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'G L U C O S A',
                  style: TextStyle(
                    fontSize: 36 
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Fecha: ',
                          style: TextStyle(fontSize: 18.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Hora: ',
                          style: TextStyle(fontSize: 18.0),
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
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                       const Expanded(
                        flex: 2,
                        child: Text(
                          'Momento de medición: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownButton(
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                              print(value);
                            });
                          },
                        ),
                      ),                  
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Glucosa: ',
                          style: TextStyle(fontSize: 18.0),
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
                const SizedBox(height: 30),
                ButtonGlucose(
                  text: 'Guardar',
                  onTap: saveGlucose
                ),
              ],              
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _nameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final typediabetesController = TextEditingController();
  final _weightController = TextEditingController();
  final _sizeController = TextEditingController();
  final _imcController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  String dropdownValue = "Tipo 1";

  List<String> list = <String>[
    "Tipo 1",
    "Tipo 2",
    "Gestacional"
  ];

  void saveProfile(){
    final newProfile = <String, dynamic>{
      "name": _nameController.text,
      "fullname": _fullnameController.text,
      "birthdate": _birthdateController.text,
      "typediabetes": dropdownValue,
      "weight": int.parse(_weightController.text),
      "size": int.parse(_sizeController.text),
      "imc": int.parse(_imcController.text),
    };
    _db.collection("profile").add(newProfile).then((DocumentReference doc) =>
      print('DocumentSnaps added with ID: ${doc.id}'));
    
    print(_nameController.text);
    print(_fullnameController.text);
    print(_birthdateController.text);
    print(dropdownValue);
    print(_weightController.text);
    print(_sizeController.text);
    print(_imcController.text);
    // Clean form profile
    _nameController.clear();
    _fullnameController.clear();
    _birthdateController.clear();
    _weightController.clear();
    _sizeController.clear();
    _imcController.clear();
    // Restart dropdown's first value
    setState(() {
      dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'P E R F I L',
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
                          'Nombre: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldProfile(
                          controller: _nameController,
                          obscureText: false,
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
                          'Apellido: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldProfile(
                          controller: _fullnameController,
                          obscureText: false,
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
                          'Fecha de Nacimiento: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DateTextFieldProfile(
                          controller: _birthdateController,
                          obscureText: false,
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
                          'Tipo de Diabetes: ',
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
                            });
                          },
                        )  
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
                          'Peso: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        // child: ButtonNumericProfile(),
                        child: TextFieldProfile(
                          controller: _weightController,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          suffix: const Text('kg'),
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
                          'Talla: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        // child: TextFieldNumericProfile(),
                        child: TextFieldProfile(
                          controller: _sizeController,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          suffix: const Text('cm'),
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
                          'Indice de Masa Corporal: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldProfile(
                          controller: _imcController,
                          obscureText: false,
                        ),
                      ),                  
                    ],
                  ),
                ),     
                const SizedBox(height: 40),      
                ButtonProfile(
                  text: 'Guardar',
                  onTap: saveProfile,
                ),     
              ],
            ),
          ),
        ),
      ),
    );
  }
}
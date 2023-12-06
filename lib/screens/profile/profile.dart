import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final user = FirebaseAuth.instance.currentUser!.email;
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

  void saveProfile() async {
  try {
    final newProfile = {
      if (_nameController.text.isNotEmpty) "name": _nameController.text,
      if (_fullnameController.text.isNotEmpty) "fullname": _fullnameController.text,
      if (_birthdateController.text.isNotEmpty) "birthdate": _birthdateController.text,
      if (dropdownValue.isNotEmpty) "typediabetes": dropdownValue,
      if (_weightController.text.isNotEmpty) "weight": int.parse(_weightController.text),
      if (_sizeController.text.isNotEmpty) "size": int.parse(_sizeController.text),
      if (_imcController.text.isNotEmpty) "imc": int.parse(_imcController.text),
    };

    final profileRef = _db.collection("profile").doc(user);

    // Obtener el perfil existente
    final profileSnapshot = await profileRef.get();

    if(profileSnapshot.exists) {
      // Perfil existente, verificar campos cambiados
      final Map<String, dynamic> existingProfile = profileSnapshot.data() as Map<String, dynamic>;

      final Map<String, dynamic> updatedFields = {};

      newProfile.forEach((key, value) {
        if (existingProfile.containsKey(key) && existingProfile[key] != value) {
          updatedFields[key] = value;
        }
      });

      if (updatedFields.isNotEmpty) {
        profileRef.update(updatedFields).then((_) => print("Perfil actualizado con éxito"));
      } else {
        print("No hay cambios para actualizar.");
      }
      }else {
        profileRef.set(newProfile).then((_) => print("Perfil creado con éxito"));
      }
    } catch (e) {
      print("Error al procesar los datos: $e");
    }
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
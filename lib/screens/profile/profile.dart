import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/profile/buttonNumericProfile.dart';
import 'package:tesis_project_v1/widgets/profile/buttonProfile.dart';
import 'package:tesis_project_v1/widgets/profile/dateTextFieldProfile.dart';
import 'package:tesis_project_v1/widgets/profile/dropDownProfile.dart';
import 'package:tesis_project_v1/widgets/profile/textfieldProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final nameController = TextEditingController();
  final fullnameController = TextEditingController();
  final birthdateController = TextEditingController();
  final typediabetesController = TextEditingController();
  final weightController = TextEditingController();
  final sizeController = TextEditingController();
  final imcController = TextEditingController();

  void saveProfile() {

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
                          controller: nameController,
                          hintText: 'Nombre',
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
                          controller: fullnameController,
                          hintText: 'Apellido',
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
                          controller: birthdateController,
                          hintText: 'Fecha de Nacimiento',
                          obscureText: false,
                        ),
                      ),                  
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Tipo de Diabetes: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropDownProfile(),
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
                        // child: TextFieldProfile(
                        //   controller: weightController,
                        //   hintText: 'Peso',
                        //   obscureText: false,
                        // ),
                        child: ButtonNumericProfile(
                          // controller: numberController,
                          // hintText: 'Numero',
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
                          controller: sizeController,
                          hintText: 'Talla',
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
                          'Indice de Masa Corporal: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldProfile(
                          controller: imcController,
                          hintText: 'Indice de Masa Corporal',
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
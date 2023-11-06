import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/glucose/buttonGlucose.dart';
import 'package:tesis_project_v1/widgets/glucose/dateTextFieldGlucose.dart';
import 'package:tesis_project_v1/widgets/glucose/textfieldGlucose.dart';
import 'package:intl/intl.dart';
import 'package:tesis_project_v1/widgets/profile/dateTextFieldProfile.dart';

class glucoseScreen extends StatefulWidget {
  const glucoseScreen({super.key});

  @override
  State<glucoseScreen> createState() => _glucoseScreenState();
}

class _glucoseScreenState extends State<glucoseScreen> {

  final dateController = TextEditingController();
  final momentController = TextEditingController();
  final glucoseController = TextEditingController();

  void saveGlucose(){}

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SafeArea(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          controller: dateController,
                          hintText: 'Ingresa fecha',
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
                          'Momento de medición: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldGlucose(
                          controller: momentController,
                          hintText: 'Momento de medición',
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
                          'Glucosa: ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFieldGlucose(
                          controller: glucoseController,
                          hintText: 'Glucosa',
                          obscureText: false,
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
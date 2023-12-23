import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
import 'package:permission_handler/permission_handler.dart';


class ExportGlucose extends StatefulWidget {
  const ExportGlucose({super.key});

  @override
  State<ExportGlucose> createState() => _ExportGlucoseState();
}

class _ExportGlucoseState extends State<ExportGlucose> {

  List<Map<String, dynamic>> glucoseRecords = [
    {'fecha': '2023-01-01', 'hora': '08:00 AM', 'momentoMedicion': 'En ayunas', 'nivelGlucosa': 120},
    {'fecha': '2023-01-01', 'hora': '12:30 PM', 'momentoMedicion': 'Después del almuerzo', 'nivelGlucosa': 150},
    {'fecha': '2023-01-02', 'hora': '07:45 AM', 'momentoMedicion': 'En ayunas', 'nivelGlucosa': 110},
    {'fecha': '2023-01-02', 'hora': '03:15 PM', 'momentoMedicion': 'Antes de la cena', 'nivelGlucosa': 130},
  ];

  void showDownloadSuccessAlert() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Descarga Exitosa"),
        content: const Text("El archivo se ha descargado correctamente."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar"),
          ),
        ],
      );
    },
  );
}

  Future<void> requestPermissionsAndGenerateExcel() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      generateAndSaveExcel();
      showDownloadSuccessAlert();
    } else if (status.isDenied) {
      throw Exception("El usuario denegó el permiso");
    } else if (status.isPermanentlyDenied) {
      throw Exception("El usuario denegó permanentemente el permiso");
    } else {
      throw Exception("Registro no autorizado");
    }
  }


  // Future<void> generateAndSaveExcel() async {
  //   final xcel.Workbook workbook = xcel.Workbook();
  //   final xcel.Worksheet sheet = workbook.worksheets[0];
  //   const String excelFile = 'test_registers';
    
  //   sheet.getRangeByIndex(1, 1).setText('Fecha');
  //   sheet.getRangeByIndex(1, 2).setText('Hora');
  //   sheet.getRangeByIndex(1, 3).setText('Momento de medición');
  //   sheet.getRangeByIndex(1, 4).setText('Nivel de glucosa (mg/dL)');


  //   // save the document in the downloads file
  //   final List<int> bytes = workbook.saveAsStream();
  //   // print('bytes: $bytes');
  //   File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);
  //   // print('success file');
  //   workbook.dispose();
  // }

  Future<void> generateAndSaveExcel() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!.email;
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    const String excelFile = 'test_registerss';

    sheet.getRangeByIndex(1, 1).setText('Fecha');
    sheet.getRangeByIndex(1, 2).setText('Hora');
    sheet.getRangeByIndex(1, 3).setText('Momento de medición');
    sheet.getRangeByIndex(1, 4).setText('Nivel de glucosa (mg/dL)');

    // Obtener la colección de registros de glucosa desde Firestore
    final QuerySnapshot<Map<String, dynamic>> glucoseSnapshot =
        await db.collection("profile").doc(user).collection("glucose").get();

    // Iterar sobre los documentos y agregarlos al archivo Excel
    int rowIndex = 2; // Comenzamos en la segunda fila para datos
    for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
        in glucoseSnapshot.docs) {
      final glucoseData = doc.data();
      final date = glucoseData['date'];
      final time = glucoseData['time'];
      final medicationMoment = glucoseData['medication_moment'];
      final glucose = glucoseData['glucose'].toDouble();

      sheet.getRangeByIndex(rowIndex, 1).setText(date);
      sheet.getRangeByIndex(rowIndex, 2).setText(time);
      sheet.getRangeByIndex(rowIndex, 3).setText(medicationMoment);
      sheet.getRangeByIndex(rowIndex, 4).setNumber(glucose);

      rowIndex++;
    }

    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    print('bytes: $bytes');
    File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);
    print('success file');
    workbook.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 37, 170, 113),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            await requestPermissionsAndGenerateExcel();
          },    
          child: const Text('Exportar Registros', style: TextStyle(color: Colors.white))
        ),
      );
  }
}
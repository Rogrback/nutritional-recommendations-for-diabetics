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

  void showPermanentlyDeniedAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permisos permanentemente denegados'),
          content: const Text('Por favor, habilite los permisos de almacenamiento en la configuración de la aplicación.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void showDeniedSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Permiso de almacenamiento denegado')),
    );
  }

  void showErrorPermissionSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al solicitar permisos')),
      );
  }

  Future<void> generateAndSaveExcel() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!.email;
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    const String excelFile = 'informacion_registros_glucosa';

    sheet.getRangeByIndex(1, 1).setText('Fecha');
    sheet.getRangeByIndex(1, 2).setText('Hora');
    sheet.getRangeByIndex(1, 3).setText('Momento de medición');
    sheet.getRangeByIndex(1, 4).setText('Nivel de glucosa (mg/dL)');

    final QuerySnapshot<Map<String, dynamic>> glucoseSnapshot =
        await db.collection("profile").doc(user).collection("glucose").get();

    int rowIndex = 2;
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

    final List<int> bytes = workbook.saveAsStream();
    File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);
    workbook.dispose();
  }

  Future<void> requestPermissionsAndGenerateExcel() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      generateAndSaveExcel();
      showDownloadSuccessAlert();
    } else if (status.isDenied) {
      showDeniedSnackbar();
    } else if (status.isPermanentlyDenied) {
      showPermanentlyDeniedAlert();
    } else {
      showErrorPermissionSnackbar();
    }
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
          child: const Text('Exportar registros de glucosa', style: TextStyle(color: Colors.white))
        ),
      );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
// import 'package:path/path.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_datagrid_export/export.dart';


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

  void showDownloadSuccessAlert(BuildContext context) {
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
      print("Registro autorizado");

      showDownloadSuccessAlert(context);
    } else if (status.isDenied) {
      print("El usuario denegó el permiso");
    } else if (status.isPermanentlyDenied) {
      print("El usuario denegó permanentemente el permiso");
      openAppSettings();
    } else {
      print("Registro no autorizado");
    }
  }

  Future<void> generateAndSaveExcel() async {
    final xcel.Workbook workbook = xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[0]; // the sheet we will be populating (only the first sheet)
    const String excelFile = 'test_download'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(1, 1).setText('All Students');
    sheet.getRangeByIndex(2, 1).setText('Form 4 West'); // example class
    sheet.getRangeByIndex(4, 1).setText('Student Name');

    // set the titles for the subject results we want to fetch
    sheet.getRangeByIndex(4, 2).setText('Maths');
    sheet.getRangeByIndex(4, 3).setText('English');
    sheet.getRangeByIndex(4, 4).setText('Kiswahili');
    sheet.getRangeByIndex(4, 5).setText('Physics');
    sheet.getRangeByIndex(4, 6).setText('Biology');
    sheet.getRangeByIndex(4, 7).setText('Chemistry');
    sheet.getRangeByIndex(4, 8).setText('Geography');
    sheet.getRangeByIndex(4, 9).setText('Spanish');
    sheet.getRangeByIndex(4, 10).setText('Total');

    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    print('bytes: $bytes');
    File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);

    print('success file');

    //dispose the workbook
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
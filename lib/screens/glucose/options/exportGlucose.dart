import 'dart:io';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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


  // void exportToExcel(List<Map<String, dynamic>> glucoseRecords) async {
  //   try {
  //     var excel = Excel.createExcel();
  //     var sheet = excel['Sheet1'];

  //     // Agregar encabezados usando tu método preferido
  //     sheet.cell(CellIndex.indexByString('A1')).value = const TextCellValue('Fecha');
  //     sheet.cell(CellIndex.indexByString('B1')).value = const TextCellValue('Hora');
  //     sheet.cell(CellIndex.indexByString('C1')).value = const TextCellValue('Momento de Medición');
  //     sheet.cell(CellIndex.indexByString('D1')).value = const TextCellValue('Nivel de Glucosa');

  //     // Agregar registros
  //     for (int i = 0; i < glucoseRecords.length; i++) {
  //       var record = glucoseRecords[i];
  //       sheet.appendRow([
  //         TextCellValue(record['fecha'] as String),
  //         TextCellValue(record['hora'] as String),
  //         TextCellValue(record['momentoMedicion'] as String),
  //         TextCellValue(record['nivelGlucosa'].toString()),
  //       ]);
  //     }

  //   var fileBytes = excel.save();
  //   var directory = await getApplicationDocumentsDirectory();
  //   var file = 'glucose_records.xlsx';

  //   File(join('$directory/$file'))
  //   ..createSync(recursive: true)
  //   ..writeAsBytesSync(fileBytes!);

  //     print('Archivo Excel guardado con éxito en: $file');
  //   } catch (e) {
  //     print('Error al guardar el archivo Excel: $e');
  //   }
  // }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Future<Directory?>? _appDocumentsDirectory;

  void _requestAppDocumentsDirectory() {
    try {

      var excel = Excel.createExcel();
      var sheet = excel['Sheet1'];

      // Agregar encabezados usando tu método preferido
      sheet.cell(CellIndex.indexByString('A1')).value = const TextCellValue('Fecha');
      sheet.cell(CellIndex.indexByString('B1')).value = const TextCellValue('Hora');
      sheet.cell(CellIndex.indexByString('C1')).value = const TextCellValue('Momento de Medición');
      sheet.cell(CellIndex.indexByString('D1')).value = const TextCellValue('Nivel de Glucosa');

      // Agregar registros
      for (int i = 0; i < glucoseRecords.length; i++) {
        var record = glucoseRecords[i];
        sheet.appendRow([
          TextCellValue(record['fecha'] as String),
          TextCellValue(record['hora'] as String),
          TextCellValue(record['momentoMedicion'] as String),
          TextCellValue(record['nivelGlucosa'].toString()),
        ]);
      }

    var fileBytes = excel.save();
    var directory = getApplicationDocumentsDirectory();
    var file = 'glucose_records.xlsx';

    File(join('$directory/$file'))
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

    setState(() {
      _appDocumentsDirectory = getApplicationCacheDirectory();
    });

    print('Archivo Excel guardado con éxito en: $file');
    } catch (e) {
      print('Error al guardar el archivo Excel: $e');
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   return Center(
  //       child:Column(
  //         children: <Widget>[
  //           ElevatedButton(
  //             onPressed: _requestAppDocumentsDirectory,
  //             child: const Text('Exportar Data'),
              
  //           ),
  //           FutureBuilder<Directory?>(
  //             future: _appDocumentsDirectory,
  //             builder: _buildDirectory,
  //           ),
  //         ],
  //       )
  //     );
  // }

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
          onPressed: () {},
          child: const Text('Exportar Registros')),
      );
  }
}
import 'dart:io';
// import 'package:excel/excel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

//   // void _requestAppCacheDirectory() {
//   //   setState(() {
//   //     _appCacheDirectory = getApplicationCacheDirectory();
//   //   });
//   // }

//     print('Archivo Excel guardado con éxito en: $file');
//   } catch (e) {
//     print('Error al guardar el archivo Excel: $e');
//   }
// }

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> createExcel() async {
  final Workbook workbook = Workbook();
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  final String path = (await getApplicationSupportDirectory()).path;
  const String filee = 'file.xlss';
  final String fileName = '$path/$filee';
  final File file = File(fileName);
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open(fileName);
}  


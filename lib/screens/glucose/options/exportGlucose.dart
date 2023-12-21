import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:path/path.dart';
import 'dart:convert';
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
      print("Registro autorizado");
      generateExcel();
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

  // Future permissionExternalStorage() async {
  //   final isEnable = await Permission.manageExternalStorage.isGranted;
  //   final isEnableStorage = await Permission.storage.isGranted;
  //   if(!isEnable){
  //     await Permission.manageExternalStorage.request();
  //   }
  //   if(!isEnableStorage){
  //     await Permission.storage.request();
  //   }
  // }

  // Future<String?> _getSavedDir() async {
  //   String? externalStorageDirPath;
  //   if(Platform.isAndroid){
  //     try {
  //       // externalStorageDirPath = await AndroidPathProvider.do
  //     } catch (err) {
        
  //     }
  //   }
  // }



  Future<void> generateExcel() async {
    final Workbook workbook = new Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    Style globalStyle = workbook.styles.add('style');
    globalStyle.backColor = '#37D8E9';
    globalStyle.fontName = 'Times New Roman';
    globalStyle.fontSize = 20;
    globalStyle.fontColor = '#C67878';
    globalStyle.italic = true;
    globalStyle.bold = true;
    globalStyle.underline = true;
    globalStyle.wrapText = true;
    globalStyle.indent = 1;
    globalStyle.hAlign = HAlignType.left;
    globalStyle.vAlign = VAlignType.bottom;
    globalStyle.rotation = 90;
    globalStyle.borders.all.lineStyle = LineStyle.thick;
    globalStyle.borders.all.color = '#9954CC';
    globalStyle.numberFormat = '_(\$* #,##0_)';
    sheet.getRangeByName('A1').cellStyle = globalStyle;
    globalStyle = workbook.styles.add('style1');
    globalStyle.backColorRgb = const Color.fromARGB(245, 22, 44, 144);
    globalStyle.fontColorRgb = const Color.fromARGB(255, 244, 22, 44);
    globalStyle.borders.all.lineStyle = LineStyle.double;
    globalStyle.borders.all.colorRgb = const Color.fromARGB(255, 44, 200, 44);
    sheet.getRangeByName('A4').cellStyle = globalStyle;
    final List<int> bytes = workbook.saveAsStream();
    File('ApplyGlobalStyle.xlsx').writeAsBytes(bytes);
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
          // onPressed: createExcel,
          // onPressed: () {},
          child: const Text('Exportar Registros', style: TextStyle(color: Colors.white))
        ),
      );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LineChartSample22 extends StatefulWidget {
  const LineChartSample22({Key? key}) : super(key: key);

  @override
  State<LineChartSample22> createState() => _LineChartSample22State();
}

class _LineChartSample22State extends State<LineChartSample22> {
  late List<Color> gradientColors;
  bool showAvg = false;
  late List<Map<String, dynamic>> glucoseDataList;

  @override
  void initState() {
    super.initState();
    gradientColors = [Colors.blue, Colors.green];
    // Simula datos de Firestore, reemplaza esto con tu lógica para obtener datos de Firestore
      glucoseDataList = [
      {'glucose': 125, 'date': '19-11-23'},
      {'glucose': 135, 'date': '20-11-23'},
      {'glucose': 109, 'date': '21-11-23'},
      {'glucose': 119, 'date': '22-11-23'},
      {'glucose': 122, 'date': '23-11-23'},
      {'glucose': 105, 'date': '24-11-23'},
      {'glucose': 129, 'date': '25-11-23'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? const Color.fromARGB(255, 190, 78, 78).withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  DateTime convertToDate(String dateString) {
    var parts = dateString.split("-");
    var day = int.parse(parts[0]);
    var month = int.parse(parts[1]);
    var year = 2000 + int.parse(parts[2]);
    return DateTime(day, month, year);
  }

  LineChartData mainData() {
    return LineChartData(
      // ... Otras configuraciones ...
      lineBarsData: [
        LineChartBarData(
          spots: getLastNRecords(2),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    // Implementa la lógica para datos promedio si es necesario
    // ... Tu implementación aquí ...
    return LineChartData();
  }

  List<FlSpot> getLastNRecords(int n) {
    if (glucoseDataList.length <= n) {
      return glucoseDataList.map((glucoseData) {
        var x = convertToDate(glucoseData['date']).millisecondsSinceEpoch.toDouble();
        var y = glucoseData['glucose'].toDouble();
        print(convertToDate(glucoseData['date']));
        print(glucoseData['date']);
        print("Primera condicion");
        print(x);
        print(y);
        print("---------------------");
        return FlSpot(
          x,
          y
        );
      }).toList();
    } else {
      return glucoseDataList.sublist(glucoseDataList.length - n).map((glucoseData) {
        var x = convertToDate(glucoseData['date']).millisecondsSinceEpoch.toDouble();
        var y = glucoseData['glucose'].toDouble();
        print("Segunda condicion");
        print(x);
        print(y);
        print("---------------------");
        return FlSpot(
          x,
          y
        );
      }).toList();
    }
  }
}

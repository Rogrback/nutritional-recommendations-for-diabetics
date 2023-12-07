// class LineChartSample2 extends StatefulWidget {
//   const LineChartSample2({Key? key}) : super(key: key);

//   @override
//   _LineChartSample2State createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   List<Color> gradientColors = [Colors.blue, Colors.green];
//   List<FlSpot> spots = [];

//   @override
//   void initState() {
//     super.initState();
//     // Aquí deberías obtener tus datos desde Firestore y construir los FlSpot
//     fetchDataFromFirestore();
//   }

//   Future<void> fetchDataFromFirestore() async {
//     // Simulación de la obtención de datos desde Firestore
//     // Reemplaza esto con tu lógica real de Firestore
//     List<Map<String, dynamic>> firestoreData = [
//       {'date': '11-11-23', 'amount': 166},
//       {'date': '15-11-23', 'amount': 125},
//       {'date': '02-12-23', 'amount': 150},
//       {'date': '15-12-23', 'amount': 190},
//     ];

//     List<FlSpot> newSpots = [];

//     for (int i = 0; i < firestoreData.length; i++) {
//       var date = firestoreData[i]['date'];
//       var amount = firestoreData[i]['amount'];

//       // Parsear la fecha y construir FlSpot
//       var spot = FlSpot(i.toDouble() + 1, amount.toDouble());
//       newSpots.add(spot);
//     }

//     setState(() {
//       spots = newSpots;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: LineChart(
//         mainData(),
//       ),
//     );
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         horizontalInterval: 50,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         leftTitles: SideTitles(showTitles: true, interval: 50),
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           interval: 1,
//           getTitles: (value) {
//             if (value >= 1 && value <= spots.length) {
//               var date = 'Nov'; // Puedes personalizar esto según tus necesidades
//               return '$date ${spots[value.toInt() - 1].x.toInt()}';
//             }
//             return '';
//           },
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 1,
//       maxX: spots.length.toDouble(),
//       minY: 0,
//       maxY: 200,
//       lineBarsData: [
//         LineChartBarData(
//           spots: spots,
//           isCurved: true,
//           colors: gradientColors,
//           barWidth: 5,
//           isStrokeCapRound: true,
//           belowBarData: BarAreaData(
//             show: false,
//           ),
//         ),
//       ],
//     );
//   }
// }
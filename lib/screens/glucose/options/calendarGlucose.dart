import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tesis_project_v1/widgets/glucose/calendarGlucose/dataConditionalGlucose.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class CalendarGlucoseScreen extends StatefulWidget {
  const CalendarGlucoseScreen({super.key});

  @override
  State<CalendarGlucoseScreen> createState() => _CalendarGlucoseScreenState();
}

class _CalendarGlucoseScreenState extends State<CalendarGlucoseScreen> {

  DateTime today = DateTime.now();
  // final year = DateTime.now().year;
  var month = DateTime.now().month;
  var year = DateTime.now().year;

  String monthName(int numberMonth) {
    switch (numberMonth) {
      case 1:
        return 'Enero';
      case 2:
        return 'Febrero';
      case 3:
        return 'Marzo';
      case 4:
        return 'Abril';
      case 5:
        return 'Mayo';
      case 6:
        return 'Junio';
      case 7:
        return 'Julio';
      case 8:
        return 'Agosto';
      case 9:
        return 'Septiembre';
      case 10:
        return 'Octubre';
      case 11:
        return 'Noviembre';
      case 12:
        return 'Diciembre';
      default:
        return 'Mes no válido';
    }
  }

  @override
  Widget build(BuildContext context) {

    void showPreviousMonth() {
      setState(() {
        if(month <= 1) {
          month=12;
          year--;
        }else {
          month--;
        }
      });
    }

    void showNextMonth() {
      setState(() {
        if(month >= 12) {
          month=1;
          year++;
        }else {
          month++;
        }
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column( 
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(                  
                  icon: const Icon(Icons.navigate_before),
                  onPressed: () {
                    showPreviousMonth();
                    print('Desde calendarGlucose mes y año $month $year');
                  },
                ),
                Expanded(
                  child: Text(
                    '${monthName(month)} de $year',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 23)                  
                    )
                ),
                IconButton(                  
                  icon: const Icon(Icons.navigate_next),
                  onPressed: () {
                    showNextMonth();
                    print('Desde calendarGlucose mes y año $month $year');
                  },
                ),
              ],
            ),
            const Divider(height: 1, color: Colors.grey), 
            Expanded(
              child: DataConditionalGlucose(month: month, year: year)
            )
          ],           
        ), 
      ), 
    ); 
  } 
}
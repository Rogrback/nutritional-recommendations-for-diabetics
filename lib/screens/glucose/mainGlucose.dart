import 'package:flutter/material.dart';
import 'package:tesis_project_v1/screens/glucose/options/LineChartSample2.dart';
import 'package:tesis_project_v1/screens/main.dart';

class MainGlucoseScreen extends StatefulWidget {
  const MainGlucoseScreen({super.key});

  @override
  State<MainGlucoseScreen> createState() => _MainGlucoseScreenState();
}

class _MainGlucoseScreenState extends State<MainGlucoseScreen> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListGlucoseScreen(),
    // StatisticsGlucoseScreen(),
    LineChartSample2(),
    // LineChartSample22(),
    CalendarGlucoseScreen(),
    ExportGlucose()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: 'Registro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Estadística',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'Exportar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 49, 177, 87),
        onTap: _onItemTapped,
      ),
    );
  }
}
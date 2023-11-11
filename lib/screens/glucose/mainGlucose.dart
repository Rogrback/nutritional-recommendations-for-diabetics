import 'package:flutter/material.dart';
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
    StatisticsGlucoseScreen(),
    CalendarGlucoseScreen()
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
        // shape: const CircularNotchedRectangle(),
        // child: Container(height: 50.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: 'Registro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Estadísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendario',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
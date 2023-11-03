import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/login/square_tile.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});


  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Perfil',
      style: optionStyle,
    ),
    Text(
      'Glucosa',
      style: optionStyle,
    ),
    Text(
      'Alimentos recomendados',
      style: optionStyle,
    ),
    Text(
      'Ejercicios recomendados',
      style: optionStyle,
    ),
  ];
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.dehaze_outlined,
        //   size: 30,
        // ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Center(
          child: Text('Menú Principal'),
        )
      ),
      // appBar: AppBar(title: const Text('titulo')),
      
      body: Center(
        // child: Text(
        //   "LOGEADO COMO: ${user.email!}",
        //   style: const TextStyle(fontSize: 25),
        // ),
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: NavigationDrawer(
          // backgroundColor: Colors.black,
          // padding: EdgeInsets.zero,
          children: [            
            Column(                           
              children:[
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: const SquareTile(imagePath: 'lib/images/user.png'),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "${user.email}",
                      style: const TextStyle(fontSize:25)
                    ),
                  ),
                ),
              ] 
            ),
            ListTile(
              title: const Text('Perfil'),
              leading: const Icon(Icons.home),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Glucosa'),
              leading: const Icon(Icons.water_drop),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),            
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Alimentos recomendados'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_bike),
              title: const Text('Ejercicios recomendados'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
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
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.red[800],
        // onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2.2,
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: 
      //   FloatingActionButtonLocation.centerDocked,
    );
  }
}
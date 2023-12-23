import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:tesis_project_v1/screens/main.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});


  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  final db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> profileCollection;
  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    MainGlucoseScreen(),
    ProfileScreen(),
    RecommendedFoodsScreen(),
    RecommendedExercisesScreen()
  ];

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void alertLogout () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cerrar sesión',
            style: TextStyle(fontSize: 22),
          ),
          content: const Text(
            '¿Esta seguro de cerrar sesión?',
            style: TextStyle(fontSize: 18),          
          ),
          alignment: Alignment.center,
          elevation: 24,
          actions: [
            Row(
              children: [
                const SizedBox(width: 15),
                MiniButton(
                  text: 'Si',
                  onPressed: () {
                    signUserOut();
                    Navigator.pop(context);
                  }
                ), 
                const SizedBox(width: 65),
                MiniButton(
                  text: 'No',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ), 
              ],
            )
          ],
        );
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: NavigationDrawer(
        indicatorColor: Colors.red,
          children: [            
            Column(                           
              children:[
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: const SquareTileLogin(imagePath: 'lib/images/user.png'),
                ),
                const Center(
                  child: NameProfile(),
                ),
              ] 
            ),
            const SizedBox(height: 20),
            Divider(height: 10, color: Colors.green[800]),      
            ListTile(
              title: const Text(
                'Mi Perfil',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.green[800],
                size: 28,
              ),
              selectedColor: const Color.fromARGB(255, 37, 170, 113),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ), 
            Divider(height: 10, color: Colors.green[800]),      
            ListTile(
              title: const Text(
                'Glucosa',
                style: TextStyle(
                  fontSize: 18,
                ),  
              ),
              leading: Icon(
                Icons.water_drop,
                color: Colors.green[800],
                size: 30,
              ),
              selectedColor: const Color.fromARGB(255, 37, 170, 113),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),                 
            Divider(height: 10, color: Colors.green[800]),      
            ListTile(
              leading: Icon(
                Icons.restaurant,
                color: Colors.green[800],
                size: 30,
              ),
              title: const Text(
                'Alimentos recomendados',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              selectedColor: const Color.fromARGB(255, 37, 170, 113),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
             Divider(height: 10, color: Colors.green[800]),      
            ListTile(
              leading: Icon(
                Icons.directions_bike,
                color: Colors.green[800],
                size: 30,
              ),
              title: const Text(
                'Ejercicios recomendados',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              selectedColor: const Color.fromARGB(255, 37, 170, 113),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            Divider(height: 10, color: Colors.green[800]),      
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.green[800],
                size: 35,
              ),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: alertLogout
            ),
            Divider(height: 10, color: Colors.green[800]),      
          ],
      ),
    );
  }
}
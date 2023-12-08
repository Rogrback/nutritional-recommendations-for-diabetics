import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';
import 'package:tesis_project_v1/screens/main.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});


  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;
  late final CollectionReference<Map<String, dynamic>> profileCollection;
  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    MainGlucoseScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 170, 113),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
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
                  child: DataProfile(),
                ),
              ] 
            ),
            const SizedBox(height: 20),
            const Divider(height: 10, color: Colors.grey),      
            ListTile(
              title: const Text(
                'Perfil',
                style: TextStyle(
                  fontSize: 18,
                ),  
              ),
              leading: Icon(
                Icons.home,
                color: Colors.green[800],
                size: 30,
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 10, color: Colors.grey),      
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
                size: 28,
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),      
            const Divider(height: 10, color: Colors.grey),      
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
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 10, color: Colors.grey),      
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
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 10, color: Colors.grey),      
          ],
      ),
    );
  }
}
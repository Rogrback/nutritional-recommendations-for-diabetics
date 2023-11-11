import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';


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
    ProfileScreen(),
    MainGlucoseScreen(),
    RecommendedFoodsScreen(),
    RecommendedExercisesScreen()
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
      
      body: Center(
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
                  child: const SquareTileLogin(imagePath: 'lib/images/user.png'),
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
    );
  }
}
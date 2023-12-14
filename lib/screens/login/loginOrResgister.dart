// import 'package:flutter/material.dart';
// import 'package:tesis_project_v1/screens/main.dart';

// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _LoginOrRegisterState();
// }

// class _LoginOrRegisterState extends State<LoginOrRegister> {

//   bool showLoginScreen = true;

//   void toggleScreen() {
//     setState(() {
//       showLoginScreen = !showLoginScreen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginScreen) {
//       return LoginScreen(
//         onTap: toggleScreen,
//       );
//     }
//     else {
//       return RegisterScreen(
//         onTap: toggleScreen,
//       );
//     }
//   }
// }
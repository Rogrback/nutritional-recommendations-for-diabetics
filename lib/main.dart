import 'package:flutter/material.dart';
import 'package:tesis_project_v1/config/router/app_router.dart';
import 'package:tesis_project_v1/screens/glucose/glucose.dart';
// import 'package:tesis_project_v1/config/theme/app_theme.dart';
import 'package:tesis_project_v1/screens/login/auth.dart';
// import 'package:tesis_project_v1/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tesis_project_v1/screens/screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: appRouter,
      title: 'Nutritional diabetes app',
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      // home:  ProfileScreen(),
      // home:  AuthScreen(),
      // home: LoginScreen(),
      home: glucoseScreen(),
    );
  }
}
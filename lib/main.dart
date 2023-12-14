import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:tesis_project_v1/config/router/app_router.dart';
// import 'package:tesis_project_v1/config/theme/app_theme.dart';
import 'package:tesis_project_v1/screens/login/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tesis_project_v1/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tesis_project_v1/screens/main.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  // initializeDateFormatting('es_PE', null).then((_) {
  //   runApp(MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // routerConfig: appRouter,
      title: 'Diesvico',
      debugShowCheckedModeBanner: false,
      // home:  ProfileScreen(),
      // home: GlucoseScreen(),
      home:  AuthScreen(),
      // home: LoginScreen(),
    );
  }
}
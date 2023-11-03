import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/screens/home/home.dart';
import 'package:tesis_project_v1/screens/login/loginOrResgister.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return MyHomeScreen();
          }else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
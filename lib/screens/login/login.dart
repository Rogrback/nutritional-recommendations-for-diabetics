import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword( 
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                child: Text(
                   'Credenciales incorrectos',
                  style: TextStyle(color: Colors.white),
                ),            
              ),
            );
          }
        );
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),            
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 25),
                Text(
                  'Bienvenido de nuevo!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                const SizedBox(height: 25),
                TextFieldLogin(
                  controller: emailController,
                  hintText: 'Correo',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextFieldLogin(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                ButtonLogin(
                  text: 'Inicia sesión',
                  onTap: signUserIn,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.6,
                          color: Colors.grey[700],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'O continua con',
                          style: TextStyle(color: Colors.grey[700])
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.6,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTileLogin(imagePath: 'lib/images/facebook.png'),
                    SizedBox(width: 10),
                    SquareTileLogin(imagePath: 'lib/images/google.png'),
                  ]
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No estás registrado?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Registrate ahora',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )          
              ],
            ),
          ),
        )
      )
    );
  }
}

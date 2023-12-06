import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    try {
      if (passwordController == confirmPasswordController) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword( 
          email: emailController.text,
          password: passwordController.text,
        );
      }      
      else {
        showErrorMessage('Ambas Contraseñas no coindicen');
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showErrorMessage(e.code);
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
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF43e5a0),
                Color(0xFFb8fadd),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
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
                    'Crearemos una cuenta para ti!',
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
                  TextFieldLogin(
                    controller: confirmPasswordController,
                    hintText: 'Confirmar Contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  ButtonLogin(
                    text: 'Registrate',
                    onTap: signUserUp,
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
                        '¿Tienes una cuenta?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Ingresa ahora',
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
          ),
        )
      )
    );
  }
}

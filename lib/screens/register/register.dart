import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/screens/login/login.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class RegisterScreen extends StatefulWidget {
  // final void Function()? onTap;
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _db = FirebaseFirestore.instance;
  
  void signUserUp() async {
    try {

      final user = emailController.text;

      final newProfile = {
        "name": "",
        "fullname": "",
        "birthdate": "",
        "typediabetes": "",
        "weight": null,
        "size": null,
      };

      if (passwordController.text == confirmPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword( 
          email: emailController.text,
          password: passwordController.text,          
        );
        _db.collection("profile").doc(user).set(newProfile).onError((e, _) => e);
        print("Cuenta creada");
        showSuccessfulRegistration();
      } else {
        showFailedRegistration();
      }  
    } catch (e) {
      print("Error al procesar datos: $e");
    }
  }

  void showSuccessfulRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Exitoso'),
          content: const Text('¡Tu registro ha sido exitoso!'),
          actions: [
            TextButton(
              onPressed: () {
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
        
      },
    );
  }

  void showFailedRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Fallido'),
          content: const Text('Revisa que las contraseñas creadas coincidan'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
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

  void loginScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      )
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
                  const Text(
                    '¡CREAREMOS UNA CUENTA PARA TI!',
                    style: TextStyle(color: Color.fromARGB(255, 8, 112, 67), fontSize: 18),
                  ),
                  const SizedBox(height: 20),
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
                    text: 'Registrarse',
                    onTap: signUserUp,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Tienes una cuenta?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: loginScreen,
                        child: const Text(
                          'Ingresar ahora',
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

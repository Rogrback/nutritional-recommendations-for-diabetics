import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/screens/main.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, this.onTap});

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
      await Firebase.initializeApp();
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
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.green.shade800,
                  width: 5
                ),
              ),
              backgroundColor: Colors.green,
              title: const Center(
                child: Text(
                  'El usuario ingresado no es válido.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }
        );
      }
      if(e.code == 'email-already-in-use'){
        print('Correo en uso');
      }
    }
  }

  // void registerScreen() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => const RegisterScreen(),
  //     )
  //   );
  // }

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
                  const SquareLogoLogin(imagePath: 'lib/images/logo.png'),
                  const SizedBox(height: 25),
                  const Text(
                    '¡BIENVENIDO A DIESVICO!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 112, 67),
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(color: Color.fromARGB(255, 8, 112, 67)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ButtonLogin(
                    text: 'Iniciar sesión',
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 50),
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
                          'Registrarse ahora',
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

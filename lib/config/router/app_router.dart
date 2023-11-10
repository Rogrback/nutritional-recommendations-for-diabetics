import 'package:go_router/go_router.dart';
import 'package:tesis_project_v1/screens/glucose/glucose.dart';
// import 'package:tesis_project_v1/screens/home/home.dart';
import 'package:tesis_project_v1/screens/login/auth.dart';
// import 'package:tesis_project_v1/screens/login/login.dart';
// import 'package:tesis_project_v1/screens/register/register.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/glucose',
      builder: (context, state) => const GlucoseScreen(),
    ),
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => LoginScreen(),
    // ),
    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => RegisterScreen(),
    // ),

  ],
);
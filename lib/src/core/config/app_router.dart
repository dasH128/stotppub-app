import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'signIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'signUpClient',
      builder: (context, state) => const SignUpClientScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'signUpTransport',
      builder: (context, state) => const SignUpTransportScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
